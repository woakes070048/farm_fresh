class CreateFavouriteFarms < ActiveRecord::Migration
  def change
    create_table :favourite_farms do |t|
      t.references :restaurant, index: true
      t.references :farm, index: true

      t.timestamps null: false
    end
  end
end
