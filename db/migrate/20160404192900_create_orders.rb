class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :restaurant
      t.decimal :total_ex_vat
      t.float :vat, default: 20
      t.references :delivery_option, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true

      t.timestamps null: true
    end
  end
end
