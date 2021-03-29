require 'test_helper'

class Admin::AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_answers_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_answers_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_answers_edit_url
    assert_response :success
  end

end
