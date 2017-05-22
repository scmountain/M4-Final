class User < ActiveRecord::Base

  extend ActiveModel::Naming
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
  validates :password, presence: true

end
