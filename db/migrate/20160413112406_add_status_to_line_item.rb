class AddStatusToLineItem < ActiveRecord::Migration
  def change
    add_reference :line_items, :status, index: true, foreign_key: true
  end
end
