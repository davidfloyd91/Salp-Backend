class User < ApplicationRecord
  has_many :charts

  validates :username, uniqueness: true
	has_secure_password
end
