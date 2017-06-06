class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      puts @user.errors.inspect
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
      :pseudo)
  end
end
