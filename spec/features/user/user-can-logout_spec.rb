require "rails_helper"

RSpec.describe "As an user" do
  scenario "I can logout" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on "Logout"

    expect(current_path).to eq(signup_path)
    expect(page).to have_content("You have successfully logged out")
  end
end
