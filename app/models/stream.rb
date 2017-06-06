class Stream < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :sub_categories
  belongs_to :category

  before_save :default_values

  def default_values
    self.live ||= false
  end

  scope :live, -> { where(live: true) }

end
