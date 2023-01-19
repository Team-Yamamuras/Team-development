class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,       null: false
      t.integer :postage,           null: false
      t.integer :billing,           null: false
      t.integer :payment,           default: 0, null: false
      t.string  :name,              null: false
      t.string  :zip_code,          null: false
      t.string  :address,           null: false
      t.integer :status,            default: 0, null: false
      
      t.timestamps
    end
  end
end
