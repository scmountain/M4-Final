require "rails_helper"

RSpec.describe "As an user", :js => :true do
  scenario "I see all of my links" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

    user.links.create(title: "youtube", url: "http://www.youtube.com")

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


  visit root_path

  within('#link-create') do
    fill_in "link-title", with: "Gmail"
    fill_in "link-url", with: "http://mail.google.com"
    click_on "Create Link"
  end

  wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
     alert = wait.until { page.driver.browser.switch_to.alert }
     alert.accept

    expect(current_path).to eq(root_path)

    within all('#links-list')[0] do
      expect(page).to have_content("youtube")
      expect(page).to have_content("http://www.youtube.com")
      expect(page).to have_content("false")
    end

    within all('#links-list')[0] do
      expect(page).to have_content("Gmail")
      expect(page).to have_content("http://mail.google.com")
      expect(page).to have_content("false")
    end
  end
end
