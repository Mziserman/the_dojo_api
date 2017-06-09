class Api::V1::SubCategoriesController < ApplicationController

  def show
    @category = SubCategory.where(slug: params[:id]).last
    @stream = @category.streams

    render 'show.json'
  end

  def index
    @sub_categories = SubCategory.all

    render 'index.json'
  end

end
