class User < ActiveRecord::Base
  before_save { self.username = username.downcase }
  validates :name,      presence: true, length: { maximum: 50 }
  validates :username,  presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password,  length: { minimum: 6 }
end
