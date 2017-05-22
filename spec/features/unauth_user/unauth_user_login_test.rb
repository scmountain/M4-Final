require "rails_helper"

RSpec.describe "As unauthenticated user" do
  scenario "I am redirected to login" do
    visit root_path
    expect(current_path).to eq(login_path)
  end
end
