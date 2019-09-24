require 'test_helper'

class AdminCampSitesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_camp_sites_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_camp_sites_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_camp_sites_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_camp_sites_edit_url
    assert_response :success
  end

end
