require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

    link = user.links.create(title: "youtube", url: "http://www.youtube.com")

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


  visit root_path

    within('.link-info') do
      expect(page).to have_text("false")
    end
  end
end
