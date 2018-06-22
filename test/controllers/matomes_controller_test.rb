require 'test_helper'

class MatomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matome = matomes(:one)
  end

  test "should get index" do
    get matomes_url
    assert_response :success
  end

  test "should get new" do
    get new_matome_url
    assert_response :success
  end

  test "should create matome" do
    assert_difference('Matome.count') do
      post matomes_url, params: { matome: { discription: @matome.discription, like: @matome.like, title: @matome.title } }
    end

    assert_redirected_to matome_url(Matome.last)
  end

  test "should show matome" do
    get matome_url(@matome)
    assert_response :success
  end

  test "should get edit" do
    get edit_matome_url(@matome)
    assert_response :success
  end

  test "should update matome" do
    patch matome_url(@matome), params: { matome: { discription: @matome.discription, like: @matome.like, title: @matome.title } }
    assert_redirected_to matome_url(@matome)
  end

  test "should destroy matome" do
    assert_difference('Matome.count', -1) do
      delete matome_url(@matome)
    end

    assert_redirected_to matomes_url
  end
end
