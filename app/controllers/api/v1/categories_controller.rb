class Api::V1::CategoriesController < ApplicationController

  def index
    @categories = Category.all

    render 'index.json'
  end

  def show
    params[:id][0] = params[:id][0].capitalize
    @category = Category.where(name: params[:id]).last

    render 'show.json'
  end

end