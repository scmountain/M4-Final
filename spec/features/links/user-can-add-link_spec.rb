require "rails_helper"

RSpec.describe "As an user", :js => :true do
  scenario "I can submit a link" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


  visit root_path
    within('#link-create') do
      fill_in "link-title", with: "Gmail"
      fill_in "link-url", with: "http://mail.google.com"
      click_on "Create Link"
    end

    expect(current_path).to eq(root_path)
  end

  scenario "I cannot submit a link without title" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


  visit root_path
    within('#link-create') do
      fill_in "link-title", with: ""
      fill_in "link-url", with: "http://mail.google.com"
      click_on "Create Link"
    end

  wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
  alert = wait.until { page.driver.browser.switch_to.alert }
  alert.accept

    expect(page).to_not have_content("link created")
  end

  scenario "I cannot submit a link without valid email" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


  visit root_path
    within('#link-create') do
      fill_in "link-title", with: "Google"
      fill_in "link-url", with: ""
      click_on "Create Link"
    end

  wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
  alert = wait.until { page.driver.browser.switch_to.alert }
  alert.accept

    expect(page).to_not have_content("link created")
  end
end
