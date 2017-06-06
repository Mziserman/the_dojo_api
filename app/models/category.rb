class Category < ApplicationRecord
  has_many :streams
  has_many :sub_categories
end
