class Api::V1::SubCategoriesController < ApplicationController

  def show
    @sub_category = SubCategory.where(slug: params[:id]).last
    @stream = @sub_category&.streams

    if @stream
      render 'show.json', status: :ok
    else
      render json: {}, status: :ok
    end
  end

  def index
    @sub_categories = SubCategory.all

    render 'index.json'
  end

end
