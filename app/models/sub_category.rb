class SubCategory < ApplicationRecord
  has_and_belongs_to_many :streams
  belongs_to :category

  before_save :slug

  def slug
    self.slug = self.name.slugify
  end

end
