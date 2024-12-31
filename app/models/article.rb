class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :name, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { minimum: 5, maximum: 1000 }
end
