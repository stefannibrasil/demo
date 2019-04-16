module OrdersHelper
  def pay_type_list
    Order.pay_types.collect { |type| [type, type] }
  end
end
