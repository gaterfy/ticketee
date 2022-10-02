# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'Users can create new Ticket' do
  before do
    login_as(FactoryBot.create(:user))
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

  scenario "with an attachment" do
    fill_in "Name", with: "Add documentation for blink tag"
    fill_in "Description", with: "The blink tag has a speed attribute"
    attach_file "File", "spec/fixtures/speed.txt"
    click_button "Create Ticket"
    
    expect(page).to have_content "Ticket has been created."
    
    within(".ticket .attachment") do
      expect(page).to have_content "speed.txt"
    end
  end

  scenario "with multiple attachments", js: true do
    fill_in "Name", with: "Add documentation for blink tag"
    fill_in "Description", with: "The blink tag has a speed attribute"
    attach_file("spec/fixtures/gradient.txt", class: 'dz-hidden-input', visible: false)
    attach_file("spec/fixtures/speed.txt", class: 'dz-hidden-input', visible: false)
    attach_file("spec/fixtures/spin.txt", class: 'dz-hidden-input', visible: false)
    click_button "Create Ticket"
    expect(page).to have_content "Ticket has been created."
    within(".ticket .attachments") do
    expect(page).to have_content "speed.txt"
    expect(page).to have_content "spin.txt"
    expect(page).to have_content "gradient.txt"
    end
  end
end
