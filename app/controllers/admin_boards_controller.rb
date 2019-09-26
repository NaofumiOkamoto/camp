class AdminBoardsController < ApplicationController
  before_action :authenticate_admin!


  def index
    @search = Board.ransack(params[:q]) #検索オブジェクト
    @search_boards = @search.result
    @purposes = Purpos.all
    @boards = Board.all
    @camp_sites = CampSite.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    flash[:warning] = "#{@board.id}番の掲示板を削除しました。"
    redirect_to admin_boards_path
  end
end
