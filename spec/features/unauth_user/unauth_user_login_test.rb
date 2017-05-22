require "rails_helper"

RSpec.describe "As unauthenticated user" do
  scenario "I am redirected to login" do
    visit root_path
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Log In")
    expect(page).to have_content("Sign Up")
  end
end
