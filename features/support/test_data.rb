
def load_users
  Restaurant.destroy_all

  restaurant = Restaurant.create(name: "BROOMFIELDS FARM SHOP", email: "rest@1.com", password: "12345678", password_confirmation: "12345678", street: "School Plantation, ", city: "Worcester", post_code: "WR6 6NF", region: "Worcestershire", remote_logo_url: "https://unsplash.it/100/100/?random")

end

def load_categories
  Category.create(name: "Bakery")
  m = Category.create(name: "Meat")
  Category.create(name: "Chicken", parent: m)
  Category.create(name: "Beef", parent: m)
end

def load_items

  if Farm.find_by(email: "farm@1.com").nil?
    Farm.create(name: "BROOMFIELDS FARM SHOP", email: "farm@1.com", password: "12345678", password_confirmation: "12345678", street: "School Plantation, ", city: "Worcester", post_code: "WR6 6NF", region: "Worcestershire", remote_logo_url: "https://unsplash.it/100/100/?random")
  end

  farm = Farm.find_by(email: "farm@1.com")

  farm.items.create(name: "Broiler Chicken", quantity: 200, price: 0.50,
                    category: Category.find_by(name: "Chicken"),
                    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis quisquam, eius nobis neque amet fuga.")
  farm.items.create(name: "Broiler Chicken", quantity: 140, price: 0.75,
                    category: Category.find_by(name: "Chicken"),
                    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis quisquam, eius nobis neque amet fuga.")
  farm.items.create(name: "Broiler Chicken", quantity: 900, price: 0.30,
                    category: Category.find_by(name: "Chicken"),
                    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis quisquam, eius nobis neque amet fuga.")
  farm.items.create(name: "Broiler Chicken", quantity: 32, price: 1.50,
                    category: Category.find_by(name: "Chicken"),
                    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis quisquam, eius nobis neque amet fuga.")

end

def create_order
  DeliveryOption.create(name: "1st Class", price: 2.99)
  Status.destroy_all
  @in_progress_status = Status.create(name: "In Progress")
  restaurant = Restaurant.find_by(email: "rest@1.com")

  restaurant.basket_items.create(item: Item.first, quantity: 20)
  restaurant.basket_items.create(item: Item.last, quantity: 30)

  order = restaurant.orders.create(vat: 20, delivery_option: DeliveryOption.first)
  restaurant.basket_items.each do |basket_item|
    order.line_items.build(item_id: basket_item.item_id, quantity: basket_item.quantity)
  end
  order.save

  restaurant.basket_items.destroy_all
end

def load_all_test_data
  load_users
  load_categories
  load_items
  create_order
end

