class Article < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { minimum: 5, maximum: 1000 }
end
