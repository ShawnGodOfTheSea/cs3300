require "rails_helper"

RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Shawn McFarlins Portfolio\nEverything I Have Made So Far\nNew project\nSign Up\nSign Out")
  end
end