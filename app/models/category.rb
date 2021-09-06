class Category < ApplicationRecord
  PAGINATION_ITEMS = 5
  has_rich_text :body
  has_many :articles
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
end
