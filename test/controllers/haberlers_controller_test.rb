require 'test_helper'

class HaberlersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @haberler = haberlers(:one)
  end

  test "should get index" do
    get haberlers_url
    assert_response :success
  end

  test "should get new" do
    get new_haberler_url
    assert_response :success
  end

  test "should create haberler" do
    assert_difference('Haberler.count') do
      post haberlers_url, params: { haberler: { baslik: @haberler.baslik, icerik: @haberler.icerik } }
    end

    assert_redirected_to haberler_url(Haberler.last)
  end

  test "should show haberler" do
    get haberler_url(@haberler)
    assert_response :success
  end

  test "should get edit" do
    get edit_haberler_url(@haberler)
    assert_response :success
  end

  test "should update haberler" do
    patch haberler_url(@haberler), params: { haberler: { baslik: @haberler.baslik, icerik: @haberler.icerik } }
    assert_redirected_to haberler_url(@haberler)
  end

  test "should destroy haberler" do
    assert_difference('Haberler.count', -1) do
      delete haberler_url(@haberler)
    end

    assert_redirected_to haberlers_url
  end
end
