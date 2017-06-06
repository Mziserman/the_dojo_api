class Stream < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :sub_categories
  belongs_to :category
end
