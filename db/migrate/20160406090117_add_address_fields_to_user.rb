class AddAddressFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :post_code, :string
    add_column :users, :region, :string
    add_column :users, :logo, :text
  end
end
