class AdminUsersController < ApplicationController
  before_action :authenticate_admin!

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
    if @user.destroy
      flash[:warning] = "#{@user.name}を削除しました。"
      redirect_to admin_users_path
    else
      render :index
    end
  end

end
