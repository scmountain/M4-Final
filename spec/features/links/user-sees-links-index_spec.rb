require "rails_helper"

RSpec.describe "As an user" do
  scenario "I can submit a link" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    within('.link-form') do
      fill_in "Title", with: "Gmail"
      fill_in "URL", with: "http://mail.google.com"
      click_on "Submit"
    end

    expect(current_path).to eq(root_path)
  end
end
