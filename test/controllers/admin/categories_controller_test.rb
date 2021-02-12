# frozen_string_literal: true

require 'test_helper'

module Admin
  class CategoriesControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get admin_categories_index_url
      assert_response :success
    end
  end
end
