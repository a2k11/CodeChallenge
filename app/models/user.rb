class User < ActiveRecord::Base
  has_secure_password
  has_many :posts

  attr_accessible :admin, :password, :password_confirmation, :email,
                  :github, :twitter, :username

  validates :password, presence: { on: :create }
  validates :username, presence: true, uniqueness: true

  def to_param
    username
  end
end
