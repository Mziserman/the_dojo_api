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
    streams = []

    params[:slug].each do |slug|
      streams << Category.where(slug: slug).first&.streams
    end
    streams.flatten!

    @popular_streams = streams.slice(0, 4)
    @other_streams = streams.slice(4, streams.length)
    unless @other_streams.nil?
      @other_streams.each do |stream|
        if @category_streams[stream.category.slug].nil?
          @category_streams[stream.category.slug] = [stream]
        else
          @category_streams[stream.category.slug] << stream
        end
      end
    end

    @category_streams.each_key do |key|
      @category_streams[key].slice!(8, @category_streams[key].length)
    end

    # @other_streams.ma

    render 'search.json'

    # all_streams = raw_streams.uniq.flatten
    # @first_selection = all_streams.slice(0, 16)
    # @second_selection = all_streams.slice(16, all_streams.length)

    # render 'search.json', status: :ok
  end

end
