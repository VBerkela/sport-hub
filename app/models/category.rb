class Category < ApplicationRecord
  PAGINATION_ITEMS = 5

  has_many :articles
  has_one_attached :image
end