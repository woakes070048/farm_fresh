class CreateBasketItems < ActiveRecord::Migration
  def change
    create_table :basket_items do |t|
      t.references :item, index: true, foreign_key: true
      t.references :restaurant, index: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
