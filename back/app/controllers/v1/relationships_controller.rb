class V1::RelationshipsController < ApplicationController
  def create
    current_user = User.find(params[:current_user_id])
    @user = User.find(params[:id])
    current_user.save(@user)
    render json: @user.id    
  end

  def destroy
    current_user = User.find(params[:current_user_id])
    @user = User.find(params[:id])
    current_user.destroy(@user)
    render json: @user.id
  end
end
