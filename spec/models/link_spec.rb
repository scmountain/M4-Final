require "rails_helper"

RSpec.describe Link, type: :model do
  context "validations" do
    it { should validate_presence_of(:title) }
  end
  context "relationships" do
    it { should belong_to :user }
  end
end
