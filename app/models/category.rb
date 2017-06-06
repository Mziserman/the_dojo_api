class Category < ApplicationRecord
  has_and_belongs_to_many :streams
  has_many :sub_categories
end
