require 'test_helper'

class BlogContentsControllerTest < ActionController::TestCase
  setup do
    @blog_content = blog_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blog_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blog_content" do
    assert_difference('BlogContent.count') do
      post :create, blog_content: { blog_id: @blog_content.blog_id, content: @blog_content.content }
    end

    assert_redirected_to blog_content_path(assigns(:blog_content))
  end

  test "should show blog_content" do
    get :show, id: @blog_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blog_content
    assert_response :success
  end

  test "should update blog_content" do
    patch :update, id: @blog_content, blog_content: { blog_id: @blog_content.blog_id, content: @blog_content.content }
    assert_redirected_to blog_content_path(assigns(:blog_content))
  end

  test "should destroy blog_content" do
    assert_difference('BlogContent.count', -1) do
      delete :destroy, id: @blog_content
    end

    assert_redirected_to blog_contents_path
  end
end
