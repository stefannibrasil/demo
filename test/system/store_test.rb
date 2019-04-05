require "application_system_test_case"

class StoreTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit store_index_path

    assert page.has_text? 'Your Pragmatic Catalog'
  end
end