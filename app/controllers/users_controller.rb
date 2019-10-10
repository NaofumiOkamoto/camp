class UsersController < ApplicationController
  skip_before_action :facebook_sign_up

  def show
    @user = User.find(params[:id])
    # お気に入りキャンプ場
    @camps = @user.like_camps.includes(camp_site: :camp_images_attachments).includes(camp_site: :camp_images_blobs)  # お気に入りキャンプ場
    # お気に入り掲示板
    @boards = @user.like_boards.includes(board: {user: :user_image_attachment}).includes(board: :camp_site).includes(board: {user: :user_image_attachment})  # 気になる掲示板
    # 掲示板投稿履歴
    @post_boards = @user.boards
    # フォロー、フォロワー
    @following = @user.following.where(params[:id]).includes(:user_image_attachment).includes(:user_image_blob)
    @followers = @user.followers.where(params[:id]).includes(:user_image_attachment).includes(:user_image_blob)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(
    :name,
    :nickname,
    :prefecture_id,
    :email,
    :introduction, 
    :user_image
    )
  end

end
