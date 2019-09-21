class BoardsController < ApplicationController
  def new
    @board = Board.new
    @user = User.find_by(id: current_user.id)
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:success] = "掲示板を作成しました"
      redirect_to board_path"#{@board.id}"
    else
      render :new
    end
  end

  def index
    @search_board = Board.ransack(params[:q])
    @search_board_count = @search_board.result
    @search_board_sites = @search_board.result.page(params[:page]).per(6) #検索結果
    @purposes = Purpos.all
    @camp_site = CampSite.all
  end

  def show
    @board = Board.find(params[:id])
    if cookies[:recent_board_id].nil?
      cookies[:recent_board_id] = @board.id.to_s
    else
      cookies[:recent_board_id] += "," + @board.id.to_s
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
    if params[:board][:image_ids]
      params[:board][:image_ids].each do |image_id|
        image = @board.board_images.find(image_id)
        image.purge
      end
    end
  end
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def board_params
    params.require(:board).permit(
    :user_id,
    :date,
    :time,
    :place,
    :purpos_id,
    :detail,
    :condition,
    :comment,
    :camp_site_id,
    board_images: []
    )
  end
end
