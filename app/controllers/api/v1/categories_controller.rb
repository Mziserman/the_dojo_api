class Api::V1::CategoriesController < ApplicationController

  def index
    @categories = Category.all

    render 'index.json'
  end

  def show
    @category = Category.where(slug: params[:id]).last

    render 'show.json'
  end

end