require "rails_helper"

RSpec.describe "As an user" do
  scenario "I see all of my links" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

    link = Link.create(title: "youtube", url: "www.youtube.com")

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


  visit root_path

    within('.link-form') do
      fill_in "link[title]", with: "Gmail"
      fill_in "link[url]", with: "http://mail.google.com"
      click_on "Submit"
    end

    expect(current_path).to eq(root_path)

    within all('#link-info')[0] do
      expect(page).to have_content("youtube")
      expect(page).to have_content("www.youtube.com")
      expect(page).to have_content("false")
    end

    within all('#link-info')[1] do
      expect(page).to have_content("Gmail")
      expect(page).to have_content("mail.google.com")
      expect(page).to have_content("false")
    end
  end
end
