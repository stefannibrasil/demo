require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  setup do
    @cart = FactoryBot.create(:cart)
    @product = FactoryBot.create(:cat)
  end

  test "visiting the index" do
    visit carts_url
    assert_selector "h1", text: "Carts"
  end

  test "creating a Cart" do
    add_first_product_to_cart

    assert_text "1 Programming with Cats 2"
  end

  test "calculating the items quantity in the cart" do
    add_first_product_to_cart

    assert_text "1 Programming with Cats 2"

    add_first_product_to_cart

    assert_text "2 Programming with Cats 2"
  end

  test "updating a Cart" do
    visit carts_url
    click_on "Edit", match: :first

    click_on "Update Cart"

    assert_text "Cart was successfully updated."
  end

  test "destroying a Cart" do
    add_first_product_to_cart

    page.accept_confirm do
      click_on "Empty cart", match: :first
    end

    assert_text "Your Cart is currently empty."
  end

  def add_first_product_to_cart
    visit store_index_path

    click_on "Add to Cart", match: :first
  end
end
