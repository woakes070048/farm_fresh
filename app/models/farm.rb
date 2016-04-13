class Farm < User
  has_many :items
  has_many :line_items, through: :items

  validates_presence_of :name

  def sales_percentages

  end
end