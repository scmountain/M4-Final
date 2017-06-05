require "rails_helper"

RSpec.describe "As guest user on the index" do
  scenario "I can go to link edit page" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

    link = Link.create(title: "youtube", url: "http://www.youtube.com")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_link_path(link)

    fill_in "link[title]", with: "oops"
    fill_in "link[url]", with: "http://oops.com"
    click_button "Update Link"

    updated_link = Link.find(link.id)

    expect(updated_link.title).to eq("oops")
    expect(updated_link.url).to eq("http://oops.com")
    expect(current_path).to eq(root_path)
  end

  scenario "I fill in a blank title" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

    link = Link.create(title: "youtube", url: "http://www.youtube.com")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_link_path(link)

    fill_in "link[title]", with: ""
    click_button "Update Link"

    expect(current_path).to eq(edit_link_path(link))
    expect(page).to have_content("Title can't be blank")
  end

  scenario "I fill in an invalid Url" do
    user = User.create(name: "janedoe",
                      email: "BillytheGoat@example.com",
                    password: "password")

    link = Link.create(title: "youtube", url: "http://www.youtube.com")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_link_path(link)

    fill_in "link[url]", with: ""
    click_button "Update Link"

    expect(current_path).to eq(edit_link_path(link))
    expect(page).to have_content("Url is not a valid URL")
  end
end
