class Api::V1::CategoriesController < ApplicationController

  def index
    @categories = Category.all

    render 'index.json'
  end

end