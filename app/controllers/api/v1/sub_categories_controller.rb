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

  def search
    raw_streams = []

    params[:slug].each do |slug|
      raw_streams << Stream.joins(:sub_categories).where(sub_categories: {slug: slug})
    end

    all_streams = raw_streams.uniq.flatten
    @first_selection = all_streams.slice(0, 4)
    @second_selection = all_streams.slice(4, all_streams.length)

    render 'search.json', status: :ok
  end

end
