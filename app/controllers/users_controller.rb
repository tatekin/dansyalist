class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:following, :followers]
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order("created_at DESC").page(params[:page]).per(3)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(3)
    # render "show_follow"
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(3)
    # render "show_follow"
  end
end