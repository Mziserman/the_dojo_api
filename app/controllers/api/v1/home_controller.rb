class Api::V1::HomeController < ApplicationController
  def index
    @categories = Category.all
    greater = Stream.maximum("viewers")
    @main_stream = Stream.where(viewers: greater).last
    
    render 'index.json'
  end
end