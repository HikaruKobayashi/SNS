class V1::UsersController < ApplicationController
  def index
    if params[:uid]
      @user = User.find_by(uid: params[:uid])
      following = @user.following
      render json: @user and return
    else
      users = User.all
      render json: users and return
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :uid,)
  end
end
