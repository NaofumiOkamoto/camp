require 'test_helper'

class LikeBoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get like_board" do
    get like_boards_like_board_url
    assert_response :success
  end

  test "should get unlike_board" do
    get like_boards_unlike_board_url
    assert_response :success
  end

end
