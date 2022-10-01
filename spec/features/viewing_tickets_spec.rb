# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'Users can view tickets' do
  before do
    login_as(FactoryBot.create(:user))
    vscode = FactoryBot.create(:project, name: 'Visual Studio Code')
    FactoryBot.create(:ticket, project: vscode,
                               name: 'Make it shiny!',
                               description: 'Gradients! Starbursts! Oh my!')
    ie = FactoryBot.create(:project, name: 'Internet Explorer')
    FactoryBot.create(:ticket, project: ie,
                               name: 'Standards compliance', description: "Isn't a joke.")
    visit '/'
  end
  scenario "with valid attributes" do
    click_link "Edit Ticket"
    fill_in "Name", with: "Make it really shiny!"
    click_button "Update Ticket"
    expect(page).to have_content "Ticket has been updated."
    within(".ticket h2") do
      expect(page).to have_content "Make it really shiny!"
      expect(page).not_to have_content ticket.name
    end    
  end

  scenario "with invalid attributes" do
    click_link "Edit Ticket"
    fill_in "Name", with: ""
    click_button "Update Ticket"
    expect(page).to have_content "Ticket has not been updated."
  end
end
