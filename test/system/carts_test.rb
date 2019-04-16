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
    visit store_index_path
    click_on "Add to Cart", match: :first

    assert_text "Programming with Cats 2"
  end

  test "calculating the items quantity in the cart" do
    visit store_index_path
    click_on "Add to Cart", match: :first

    assert_text "1 Programming with Cats 2"
    click_on "Add to Cart", match: :first
    assert_text "2 Programming with Cats 2"

        save_and_open_page

  end

  test "destroying a Cart" do
    visit store_index_path
    click_on "Add to Cart", match: :first

    page.accept_confirm do
      click_on "Empty cart", match: :first
    end

    assert_text "Your Cart is currently empty."
  end
end
