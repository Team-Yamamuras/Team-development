class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :category_id
      t.string :name
      t.text :introduction
      t.integer :price_without_tax
      t.boolean :is_active
      t.timestamps
    end
  end
end
