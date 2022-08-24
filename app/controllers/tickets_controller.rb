# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_project, only: %i[create new show edit update destroy]
  before_action :set_ticket, only: %i(show edit update destroy)

  def new
    @ticket = @project.tickets.build
  end

  def index; end

  def create
    @ticket = @project.tickets.build(ticket_params)
    if @ticket.save
      # byebug
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash.now[:alert] = "Ticket has not been created."
      render "new"
    end
  end

  def show
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The project you were looking for could not be found.'
    redirect_to projects_path
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end
end
