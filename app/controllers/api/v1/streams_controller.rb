class Api::V1::StreamsController < ApplicationController
  def index
    # @live_streamers = User.live.streams
    @streams = Stream.all

    render 'index.json'
  end

  def show
    streamer = User.where(channel: params[:id]).first
    unless streamer.nil?
      unless streamer.streams&.empty?
        @stream = streamer.streams.last
        render 'show.json', status: :ok
      else
        head(:unauthorized)
      end
    else
      head(:unauthorized)
    end


  end

  def create
    @stream = Stream.new(stream_params)
    @stream.save

    render json: @stream, status: :created
  end

  def destroy
    @stream = current_user.streams.where(id: params[:id]).first

    if @stream.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  def update_stream
    response = HTTParty.get('https://api.twitch.tv/kraken/streams/' +
      params[:channel] + '?client_id=' + Settings.twitch.client_id)

    @stream = Stream.where(twitch_stream_id: response["stream"]["_id"]).first


    @stream.viewers = response["stream"]["viewers"]
    @stream.thumbnail = response["stream"]["preview"]["large"]
    if @stream.max_viewers < response["stream"]["viewers"]
      @stream.max_viewers = response["stream"]["viewers"]
    end

    if @stream.save
      render 'show.json', status: :ok
    else
      puts @stream.errors.inspect
    end
  end

  private
  def stream_params
    params.require(:stream).permit(:user_id, :name, :description)
  end
end
