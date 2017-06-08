class Api::V1::SubCategoriesController < ApplicationController
  
  def show
    @category = SubCategory.where(slug: params[:sub_category]).last
    @stream = @category.streams

    render 'api/v1/categories/show.json'
  end

end