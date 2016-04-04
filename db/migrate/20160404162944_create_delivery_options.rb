class CreateDeliveryOptions < ActiveRecord::Migration
  def change
    create_table :delivery_options do |t|
      t.string :name
      t.string :desc
      t.decimal :price

      t.timestamps null: false
    end
  end
end
