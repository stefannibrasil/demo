require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = FactoryBot.create(:cart)
  end

  test "should get index" do
    get carts_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_url
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post carts_url, params: { cart: {  } }
    end

    assert_redirected_to store_index_url
  end

  test "should show cart only if the cart is store in session" do
    book = FactoryBot.create(:ruby)
    post line_items_url(:product_id => book)

    assert_redirected_to store_index_url
  end

  test "should redirect back to store if attempting to access someone else cart" do
    get cart_url(@cart)
    assert_redirected_to store_index_url
  end

  test "should get edit" do
    get edit_cart_url(@cart)
    assert_response :success
  end

  test "should update cart" do
    patch cart_url(@cart), params: { cart: {  } }
    assert_redirected_to cart_url(@cart)
  end

  test "should destroy cart" do
    post line_items_url, params: { product_id: FactoryBot.create(:cat).id }
    @cart = Cart.find(session[:cart_id])

    assert_difference('Cart.count', -1) do
      delete cart_url(@cart)
    end

    assert_redirected_to store_index_url
  end
end
