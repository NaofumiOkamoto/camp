class BoardsController < ApplicationController
  def new
    @board = Board.new
    @user = User.find_by(id: current_user.id)
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:success] = "掲示板を作成しました"
      redirect_to "/camp_sites/#{@board.camp_site_id}"
    else
      render :new
    end
  end

  def index
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
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
    :board_image
    )
  end
end
