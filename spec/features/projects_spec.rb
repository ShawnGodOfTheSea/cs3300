require 'rails_helper'

# For Devise >= 4.2.0
#include Devise::Test::ControllerHelpers
# Use the following instead if you are on Devise <= 4.2.0
# include Devise::TestHelpers

#def login_admin
#  before(:each) do
#    @request.env["devise.mapping"] = Devise.mappings[:admin]
#    admin = FactoryBot.create(:admin)
#    sign_in :user, admin # sign_in(scope, resource)
#  end
#end

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      visit new_user_registration_path
      fill_in "Email", with: "Test@uccs.edu"
      fill_in "Password", with: "Test123"
      fill_in "Password confirmation", with: "Test123"
      click_button "Sign up"
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit new_user_registration_path
      fill_in "Email", with: "Test@uccs.edu"
      fill_in "Password", with: "Test123"
      fill_in "Password confirmation", with: "Test123"
      click_button "Sign up"
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
      let!(:project) { Project.create(title: "Test title", description: "Test content") }
      before(:each) do
        visit new_user_registration_path
      fill_in "Email", with: "Test@uccs.edu"
      fill_in "Password", with: "Test123"
      fill_in "Password confirmation", with: "Test123"
      click_button "Sign up"
      end
      scenario "remove project" do
       visit project_path(project)
       click_button "Destroy this project"
       expect(page).to have_content("Project was successfully destroyed")
       expect(Project.count).to eq(0)
      end
     end
    end