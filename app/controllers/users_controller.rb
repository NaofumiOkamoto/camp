class UsersController < ApplicationController
  skip_before_action :facebook_sign_up

  def show
    @user = User.find(params[:id])
    @camps = @user.like_camps  # お気に入りキャンプ場
    @boards = @user.like_boards  # 気になる掲示板
    @post_boards = @user.boards  # 掲示板投稿履歴

    @following = @user.following.where(params[:id])
    @followers = @user.followers.where(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def index
  end

  private
  def user_params
    params.require(:user).permit(:name, :nickname, :prefecture_id, :email, :introduction, :user_image)
  end
end
