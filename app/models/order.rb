class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  validates :name, :address, :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                              :message => 'please enter a valid email'

  def self.pay_types
    ['Credit card', 'Check', 'Purchase order']
  end

   validates :pay_type, inclusion: Order.pay_types

   def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
