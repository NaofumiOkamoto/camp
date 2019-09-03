class AdminUsersController < ApplicationController
  def index
    @search = User.ransack(params[:q]) #検索オブジェクト
    @search_users = @search.result #検索結果
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:warning] = "#{@user.name}を削除しました。"
    redirect_to admin_users_path
  end

end
