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

  def search
    @category_streams = {}

    @popular_streams = Stream.limit(16)

    params[:slug].each do |slug|
      @category_streams[slug] = Category.where(slug: slug).first&.streams.limit(8)
    end
    render 'search.json'

    # all_streams = raw_streams.uniq.flatten
    # @first_selection = all_streams.slice(0, 16)
    # @second_selection = all_streams.slice(16, all_streams.length)

    # render 'search.json', status: :ok
  end

end
