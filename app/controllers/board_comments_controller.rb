class BoardCommentsController < ApplicationController
  def create
    board = Board.find(params[:board_id])
    board_comment = BoardComment.new(board_comment_params)
    board_comment.user_id = current_user.id
    board_comment.board_id = board.id
    if board_comment.save
      redirect_to board_path(board)
    else
      render template "boards/show"
    end
  end

  def destroy

  end

  private
  def board_comment_params
    params.require(:board_comment).permit(:user_id, :board_id, :comment)
  end
end
