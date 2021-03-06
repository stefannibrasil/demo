require "application_system_test_case"

class LineItemsTest < ApplicationSystemTestCase
  setup do
    @line_item = FactoryBot.create(:line_item)
  end

  test "visiting the index" do
    visit line_items_url
    assert_selector "h1", text: "Line Items"
  end

  test "destroying a Line item" do
    visit line_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Your Cart is currently empty."
  end
end
