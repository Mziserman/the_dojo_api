class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :streams
  validates :channel, uniqueness: true

  def live
    self.streams.live.length == 1
  end

  scope :default, -> { where(live: true) }
end
