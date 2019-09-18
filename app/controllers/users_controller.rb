class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @camps = @user.like_camps  # お気に入りキャンプ場
    @boards = @user.like_boards  # 気になる掲示板
    @post_boards = @user.boards  # 掲示板投稿履歴

    @camp_site = CampSite.find(params[:id])

    @following = @user.following.where(params[:id])
    @followers = @user.followers.where(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # redirect_to user_path"#{@user.id}"
  end

  def index
  end

  private
  def user_params
    params.require(:user).permit(:name, :nickname, :prefecture_id, :email, :introduction)
  end
end
