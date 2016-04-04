class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :image
      t.references :parent

      t.timestamps null: true
    end
  end
end
