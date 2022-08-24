# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'Users can create new Ticket' do
  before do
    project = FactoryBot.create(:project, name: 'Visual Studio Code')

    visit project_path(project)

    click_link 'New Ticket'
  end

  scenario 'with valid attributes' do
    fill_in 'ticket_name', with: 'Ticket'
    fill_in 'ticket_description', with: 'description'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has been created.')
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Ticket'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
