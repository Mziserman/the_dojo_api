class Api::V1::StreamsController < ApplicationController
  def index
    @live_users = User.live
    # @streams = Stream.all

    render json: @live_users, :include => :streams, status: :ok
    # render json: @streams, :except => :user_id, :include => :user, status: :ok
  end

  def show
    @streamer = User.where(channel: params[:id]).first


    render json: @streamer, :include => :streams, status: :ok
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

  private
  def stream_params
    params.require(:stream).permit(:user_id, :name)
  end
end
