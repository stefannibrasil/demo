class AddPriceToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :price, :decimal, precision: 8, scale: 2, default: 0.0, null: false
  end
end
