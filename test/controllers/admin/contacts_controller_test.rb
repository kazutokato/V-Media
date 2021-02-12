# frozen_string_literal: true

require 'test_helper'

module Admin
  class ContactsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get admin_contacts_index_url
      assert_response :success
    end

    test 'should get show' do
      get admin_contacts_show_url
      assert_response :success
    end
  end
end
