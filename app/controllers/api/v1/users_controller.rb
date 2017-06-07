class Api::V1::UsersController < ApplicationController
  def show
    unless current_user.nil?
      @user = current_user
      render 'show.json', status: :ok
    else
      head(:unauthorized)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render 'show.json', status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    if current_user&.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password,
      :password_confirmation, :first_name, :last_name, :live, :avatar,
      :pseudo, :channel)
  end
end
