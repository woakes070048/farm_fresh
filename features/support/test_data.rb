
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

