require "rails_helper"

RSpec.describe User, type: :model do
  context "secure password" do
      it { should have_secure_password }
    end

  context "relationships" do
    it { should have_many :links }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end
end
