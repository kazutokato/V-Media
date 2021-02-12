# frozen_string_literal: true

require 'test_helper'

module Admin
  class RanksControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get admin_ranks_index_url
      assert_response :success
    end
  end
end
