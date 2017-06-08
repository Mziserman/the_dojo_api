class Api::V1::CategoriesController < ApplicationController

  def index
    @categories = Category.all

    render 'index.json'
  end

  def show
    @category = Category.where(slug: params[:id]).last
    @stream = @category.streams

    render 'show.json'
  end

end