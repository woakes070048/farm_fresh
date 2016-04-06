
def load_users
  Restaurant.destroy_all

  restaurant = Restaurant.create(name: "Edgemoor Inn Ltd", street: "Gloucester Road",
                   city: "Stroud", post_code: "GL6 6ND", region: "Gloucestershire",
                   logo: "http://www.yell.comhttp://cdn.yell.com/cdn/yellapi/asset/47F5F723144887C3/thumbnail",
                   email: "rest@1.com", password: "12345678", password_confirmation: "12345678")

end

def load_categories
  Category.create(name: "Bakery")
  m = Category.create(name: "Meat")
  Category.create(name: "Chicken", parent: m)
  Category.create(name: "Beef", parent: m)
end


def load_items
  farm = Farm.create(name: "BROOMFIELDS FARM SHOP", street: "School Plantation",
            city: "Worcester", post_code: "WR6 6NF", region: "Worcestershire",
            logo: "http://www.yell.com/static/image/8921592a-afd9-406a-9cd2-638b8b7ba882_image_png?t=tr/w:132/h:97/m:FitPad",
            email: "farm@1.com", password: "12345678", password_confirmation: "12345678")
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

