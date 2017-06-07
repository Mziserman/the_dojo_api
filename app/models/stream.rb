class Stream < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :sub_categories
  belongs_to :category
  before_save :bind_twitch

  def bind_twitch
    response = HTTParty.get('https://api.twitch.tv/kraken/streams/' +
      self.user.channel + '?client_id=' + Settings.twitch.client_id)

    self.twitch_stream_id = response["stream"]["_id"]
    # byebug
    self.twitch_created_at = DateTime.parse(response["stream"]["created_at"])
    self.name = response["stream"]["channel"]["status"]
    self.viewers = response["stream"]["viewers"]
    self.max_viewers = response["stream"]["viewers"]


  end


  def uptime
    Time.now - self.twitch_created_at
  end
end
