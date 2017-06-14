class Api::V1::HomeController < ApplicationController
  def index
    @categories = Category.all
    @main_stream = Stream.live.last
    unless @main_stream.blank?
      @main_stream.update_twitch_data
      render 'index.json'
    else
      head(:no_content)
    end
  end
end
