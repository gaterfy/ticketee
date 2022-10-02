# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_project, only: %i[create new show edit update destroy]
  before_action :set_ticket, only: %i(show edit update destroy)

  def new
    @ticket = @project.tickets.build
  end

  def index; end

  def edit; end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      @alert = "Ticket has not been updated."
      render "edit"
    end
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.author = current_user

    if params[:attachments].present?
      @ticket.attachments.attach(params[:attachments])
    end

    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      @alert = "Ticket has not been created."
      render "new"
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."
    redirect_to @project
  end

  def show
    @comment = @ticket.comments.build
  end

  def upload_file
    blob = ActiveStorage::Blob.create_and_upload!(io: params[:file], filename: params[
      :file].original_filename)

    render json: { signedId: blob.signed_id }
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
    params.require(:ticket).permit(:name, :description, attachments: [])
  end
end
