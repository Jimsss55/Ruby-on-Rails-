class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles
  validates :name, presence: true,
            length: { minimum: 3, maximum: 25 },
            uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX},
            uniqueness: true
  has_secure_password
end
