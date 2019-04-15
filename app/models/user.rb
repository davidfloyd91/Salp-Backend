class User < ApplicationRecord
  has_many :charts

  validates :username, { presence: true, uniqueness: true }
  validates :email, uniqueness: true, if: -> { email.present? }

	has_secure_password
end
