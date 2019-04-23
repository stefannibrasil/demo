require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

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

    fill_in "Routing #", with: "123456"
    fill_in "Account #", with: "987654"

    perform_enqueued_jobs do
      click_button "Place Order"
    end

    orders = Order.all
    assert_equal 1, orders.size

    order = orders.first

    assert_equal "Stefanni Brasil", order.name
    assert_equal "123 Main Street",  order.address
    assert_equal "stefannibrasil@gmail.com", order.email
    assert_equal "Check", order.pay_type
    assert_equal 1, order.line_items.size

    mail = ActionMailer::Base.deliveries.last
    assert_equal ["stefannibrasil@gmail.com"], mail.to
    assert_equal 'Stefanni Brasil <stefannibrasil@gmail.com>', mail[:from].value
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
  end
end
