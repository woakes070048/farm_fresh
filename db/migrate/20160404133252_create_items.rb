class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.references :farm
      t.references :category

      t.timestamps null: true
    end
  end
end
