class V1::UsersController < ApplicationController
  def index
    if params[:uid]
      @user = User.find_by(uid: params[:uid])
      following = @user.following
      render json: { user: @user, following: following }
      return
    else
      users = User.all
      render json: users and return
    end
  end

  def show
    @user = User.find(params[:id])
    @image = @user.image
    @profile = @user.profile
    if @user
      render json: @user.to_json(methods: [:follower_count, :following_count]), image: @image, profile: @profile
    end
  end

  def edit
    @user = User.find(params[:id])
    @image = @user.image
    render json: @user, image: @image
  end

  def create
    @user = User.new(user_params)
    puts @user
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update_image
    @user = User.find(params[:id])
    @user.avatar = (params[:image])
    render json: { user: @user.to_json(methods: :avatar_url) }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :uid, :profile, :image)
  end
end
