require 'test_helper'

class Api::TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_todo = api_todos(:one)
  end

  test "should get index" do
    get api_todos_url
    assert_response :success
  end

  test "should get new" do
    get new_api_todo_url
    assert_response :success
  end

  test "should create api_todo" do
    assert_difference('Api::Todo.count') do
      post api_todos_url, params: { api_todo: {  } }
    end

    assert_redirected_to api_todo_url(Api::Todo.last)
  end

  test "should show api_todo" do
    get api_todo_url(@api_todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_todo_url(@api_todo)
    assert_response :success
  end

  test "should update api_todo" do
    patch api_todo_url(@api_todo), params: { api_todo: {  } }
    assert_redirected_to api_todo_url(@api_todo)
  end

  test "should destroy api_todo" do
    assert_difference('Api::Todo.count', -1) do
      delete api_todo_url(@api_todo)
    end

    assert_redirected_to api_todos_url
  end
end
