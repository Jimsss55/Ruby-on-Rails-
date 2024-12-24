class User < ApplicationRecord
  has_many :articles
  validates :name, presence: true,
            length: { minimum: 3, maximum: 25 },
            uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX},
            uniqueness: true
end
