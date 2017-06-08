class Api::V1::HomeController < ApplicationController
  def index
    @categories = Category.all
    greater = Stream.maximum("viewers")
    @main_stream = Stream.where(viewers: greater).last
    @main_stream.update_twitch_data


    render 'index.json'
  end
end
