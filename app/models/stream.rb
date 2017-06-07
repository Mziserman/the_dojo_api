class Stream < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :stream_file
  has_and_belongs_to_many :sub_categories
  
  before_save :bind_twitch
  before_validation :is_live?

  def is_live?
    response = HTTParty.get('https://api.twitch.tv/kraken/streams/' +
      self.user.channel + '?client_id=' + Settings.twitch.client_id)["stream"]

    if response.nil?
      puts "oui"
      throw :abort
    end
  end


  def bind_twitch
    puts "rip"
    response = HTTParty.get('https://api.twitch.tv/kraken/streams/' +
      self.user.channel + '?client_id=' + Settings.twitch.client_id)


    unless response['stream'].blank?
      self.twitch_stream_id = response["stream"]["_id"]
      self.twitch_created_at = DateTime.parse(response["stream"]["created_at"])
      self.twitch_name = response["stream"]["channel"]["status"]
      self.viewers = response["stream"]["viewers"]
      self.max_viewers = response["stream"]["viewers"]
    else
      puts 'bof'
      false
    end
  end


  def uptime
    Time.now - self.twitch_created_at
  end
end
