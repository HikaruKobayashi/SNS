class V1::RelationshipsController < ApplicationController
  def create
    current_user = User.find(params[:current_user_id])
    @user = User.find(params[:id])
    current_user.follow(@user)
    render json: @user.id    
  end

  def destroy
    current_user = User.find(params[:current_user_id])
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    render json: @user.id
  end
end
