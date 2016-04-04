class CreateItemImages < ActiveRecord::Migration
  def change
    create_table :item_images do |t|
      t.string :image
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
