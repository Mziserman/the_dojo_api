class Api::V1::StreamsController < ApplicationController
  def index
    @streams = Stream.live

    render 'index.json'
  end

  def show
    streamer = User.where(channel: params[:id]).first
    unless streamer.nil?
      unless streamer.streams&.empty?
        @stream = streamer.streams.last
        @stream.update_twitch_data

        render 'show.json', status: :ok
      else
        render json: { errors: ["No online stream for this channel"] }, status: :unauthorized
      end
    else
      render json: { errors: ["No user has this channel"] }, status: :unauthorized
    end
  end

  def create
    @stream = current_user.streams.new(stream_params)

    if @stream.is_live?
      @stream.save
      render 'show.json', status: :created
    else
      render json: { errors: ["stream is offline"] }, status: :unprocessable_entity
    end
  end

  def destroy
    @stream = current_user.streams.live.where(id: params[:id]).first
    if !@stream&.live
      render 'show.json', status: :ok
    elsif @stream&.update(live: false)
      render 'show.json', status: :ok
    else
      head(:unauthorized)
    end
  end

  def update_stream
    response = HTTParty.get('https://api.twitch.tv/kraken/streams/' +
      params[:channel] + '?client_id=' + Settings.twitch.client_id)

    @stream = Stream.where(twitch_stream_id: response["stream"]["_id"]).first

    if response["stream"].nil?
      @stream.live = false
    else
      @stream.viewers = response["stream"]["viewers"]
      @stream.thumbnail = response["stream"]["preview"]["large"]

      if @stream.max_viewers < response["stream"]["viewers"]
        @stream.max_viewers = response["stream"]["viewers"]
      end
    end

    if @stream.save
      render 'show.json', status: :ok
    else
      render json: { errors: @stream.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def stream_params
    params[:stream].to_hash
  end
end
