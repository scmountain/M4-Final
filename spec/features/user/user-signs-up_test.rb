require "rails_helper"

RSpec.describe "As unauthenticated user" do
  scenario "I am redirected to signup" do
    visit signup_path

    fill_in "Email", with: "BillytheGoat@example.com"
    fill_in "Name", with: "janedoe"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    within('.sign-up') do
      click_on "Sign Up"
    end
    expect(current_path).to eq(root_path)

    expect(page).to have_content("Logged in as janedoe")
  end
end
