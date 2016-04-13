class Farm < User
  has_many :items
  has_many :line_items, through: :items

  validates_presence_of :name

  def sales_percentages

    sales_raw = Hash.new

    line_items.each do |line_item|
      sales_raw[line_item.item.id] = 0 if sales_raw[line_item.id].nil?
      sales_raw[line_item.item.id] += line_item.quantity
    end


    total_quantity = sales_raw.map{ |k, v| v}.inject(0, :+)


    sales_as_percentages = Hash.new

    sales_raw.each do |k, v|
      sales_as_percentages[Item.find(k).name] = ((v.to_f/total_quantity) * 100).round(2)
    end

    sales_as_percentages
  end
end