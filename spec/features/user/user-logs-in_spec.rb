require "rails_helper"

RSpec.describe "As an user" do
  scenario "I can login" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit login_path
    fill_in "session[email]", with: "BillytheGoat@example.com"
    fill_in "session[password]", with: "password"

    within('.login-form') do
      click_on "Login"
    end
    expect(current_path).to eq(root_path)

    expect(page).to have_content("Signed in as janedoe")
  end
end
