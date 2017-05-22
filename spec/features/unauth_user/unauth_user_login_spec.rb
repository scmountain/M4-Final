require "rails_helper"

RSpec.describe "As unauthenticated user" do
  scenario "I am redirected to login" do
    visit root_path
    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Login")
    expect(page).to have_content("Signup")
  end
end
