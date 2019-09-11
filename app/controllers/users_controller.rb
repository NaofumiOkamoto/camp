class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @camps = @user.like_camps  # お気に入りキャンプ場
    @boards = @user.like_boards  # 気になる掲示板
    @post_boards = @user.boards  # 掲示板投稿履歴
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
  end
end
