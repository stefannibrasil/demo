require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(FactoryBot.create(:order))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["stefanni@org.com"], mail.to
    assert_equal ["stefannibrasil@gmail.com"], mail.from
  end
end
