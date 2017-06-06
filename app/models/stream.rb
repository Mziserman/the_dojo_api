class Stream < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :sub_categories
  belongs_to :category

  def uptime
    Time.now - self.twitch_created_at
  end
end
