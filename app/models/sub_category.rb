class SubCategory < ApplicationRecord
  has_and_belongs_to_many :streams
  belongs_to :category
end
