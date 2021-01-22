require 'test_helper'

class Admin::RanksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_ranks_index_url
    assert_response :success
  end

end
