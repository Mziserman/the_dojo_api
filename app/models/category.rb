class Category < ApplicationRecord
  has_many :streams
  has_many :sub_categories

  before_save :slug_attr

  def slug_attr
    self.slug = self.name.slugify
  end

end
