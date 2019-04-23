require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase

  setup do
    @product = FactoryBot.create(:ruby)
  end

  test "check routing number" do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    click_on 'Checkout'

    fill_in 'order_name', with: 'Stefanni Brasil'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'stefannibrasil@gmail.com'

    assert_no_selector '#order_routing_number'

    select 'Check', from: 'pay_type'

    assert_selector '#order_routing_number'
  end
end
