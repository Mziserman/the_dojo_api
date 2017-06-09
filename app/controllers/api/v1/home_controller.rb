class Api::V1::HomeController < ApplicationController
  def index
    @categories = Category.all
    @main_stream = Stream.first
    @main_stream.update_twitch_data


    render 'index.json'
  end
end
