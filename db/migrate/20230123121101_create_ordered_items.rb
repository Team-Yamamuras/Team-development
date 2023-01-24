class CreateOrderedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_items do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :count, null: false
      t.integer :price_tax_included, null: false
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
