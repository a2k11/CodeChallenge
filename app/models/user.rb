class User < ActiveRecord::Base
  attr_accessible :admin, :password, :password_confirmation, :username
  has_secure_password

  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
end
