class LikeBoardsController < ApplicationController
  before_action :set_variables

  def like_board
    like = current_user.like_boards.new(board_id: @board.id)
    like.save
  end

  def unlike_board
    like = current_user.like_boards.find_by(board_id: @board.id)
    like.destroy
  end
end

  private

  # js.erbで使用
  def set_variables
    @board = Board.find(params[:board_id])
    @id_name = "#like-board-link-#{@board.id}"
  end
