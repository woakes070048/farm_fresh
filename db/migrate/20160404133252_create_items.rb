class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.references :farm
      t.references :category, index: true, foreign_key: true

      t.timestamps null: true
    end
  end
end
