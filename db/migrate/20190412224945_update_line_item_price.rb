class UpdateLineItemPrice < ActiveRecord::Migration[5.2]
  def up
  # update current line_items with product price
    LineItem.all.each do |item|
      product = Product.find(item.product_id)
      item.price = product.price
      item.save!
    end
  end

  def down
    LineItem.all.each do |line_item|
      line_item.price = 0.0
    end
  end
end
