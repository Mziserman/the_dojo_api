class Category < ApplicationRecord
  has_many :streams
  has_many :sub_categories

  before_save :slug

  def slug
    self.slug = self.name.slugify
  end

end
