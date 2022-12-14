# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'Users can create new project' do
  scenario 'with valid attributes' do
    visit '/'

    click_link 'New Project'
    fill_in 'project_name', with: 'Visual studio'
    fill_in 'Description', with: 'Code editing release'
    click_button 'Create Project'

    expect(page).to have_content('Project has been created')
  end
end
