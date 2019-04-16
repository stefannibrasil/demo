require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: FactoryBot.create(:cat).id }
    end

    follow_redirect!
    assert_select 'h2', 'Your Cart'
    assert_select 'td', "Programming with Cats 2"
  end

  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: FactoryBot.create(:cat).id }, xhr: true
    end
    assert_response :success
    assert_match /<tr class=\\"line-item-highlight/, @response.body
  end

  test "should update line_item" do
    line_item = FactoryBot.create(:line_item)
    patch line_item_url(line_item), params: { line_item: { quantity: 2 } }
    assert_redirected_to line_item_url(line_item)
  end

  test "should destroy line_item" do
    line_item = FactoryBot.create(:line_item)

    assert_difference('LineItem.count', -1) do
      delete line_item_url(line_item)
    end

    assert_redirected_to store_index_url
  end
end
