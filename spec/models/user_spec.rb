require 'rails_helper'

RSpec.describe User, type: :model do
  context "Create new project" do
    before(:each) do
      authenticate_user!
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end
end
