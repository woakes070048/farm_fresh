# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


FavouriteFarm.destroy_all
ItemImage.destroy_all
LineItem.destroy_all
# CartItem.destroy_all
Item.destroy_all
Category.destroy_all
Order.destroy_all
Status.destroy_all
DeliveryOption.destroy_all
User.destroy_all

p1 = Category.create(name: "Bakery")
Category.create(name: "Bread" ,parent: p1)
b = Category.create(name: "Cakes" ,parent: p1)
Category.create(name: "Biscuits" ,parent: p1)
Category.create(name: "Pies" ,parent: p1)

p1 = Category.create(name: "Dairy")
c = Category.create(name: "Cheese" ,parent: p1)
Category.create(name: "Milk & Yoghurt" ,parent: p1)
Category.create(name: "Butter & Cream" ,parent: p1)
Category.create(name: "Eggs" ,parent: p1)

p1 = Category.create(name: "Deli")
d = Category.create(name: "Meat Products" ,parent: p1)
Category.create(name: "Non-meat Products" ,parent: p1)
Category.create(name: "Olives" ,parent: p1)
Category.create(name: "Oils & Vinegars" ,parent: p1)

p1 = Category.create(name: "Drinks")
Category.create(name: "Wine" ,parent: p1)
e = Category.create(name: "Beers & Cider" ,parent: p1)
Category.create(name: "Spirits" ,parent: p1)
Category.create(name: "Juices & Soft Drinks" ,parent: p1)

p1 = Category.create(name: "Fish")
Category.create(name: "White and Oily fish" ,parent: p1)
Category.create(name: "Smoked" ,parent: p1)
Category.create(name: "Shellfish" ,parent: p1)
f = Category.create(name: "Salmon" ,parent: p1)


p1 = Category.create(name: "Fruit")
Category.create(name: "Apples & Pears" ,parent: p1)
Category.create(name: "Soft Fruit" ,parent: p1)
g = Category.create(name: "Dried" ,parent: p1)
Category.create(name: "Preserves" ,parent: p1)

p1 = Category.create(name: "Veg")
Category.create(name: "Seasonal" ,parent: p1)
Category.create(name: "Salads & Herbs" ,parent: p1)
Category.create(name: "Mushrooms" ,parent: p1)
Category.create(name: "Root Vegetables" ,parent: p1)

p1 = Category.create(name: "Meat")
a = Category.create(name: "Beef" ,parent: p1)
Category.create(name: "Lamb" ,parent: p1)
Category.create(name: "Game" ,parent: p1)
Category.create(name: "Poultry" ,parent: p1)


farm = Farm.create(name: "BROOMFIELDS FARM SHOP", street: "School Plantation",
            city: "Worcester", post_code: "WR6 6NF", region: "Worcestershire",
            logo: "http://www.yell.com/static/image/8921592a-afd9-406a-9cd2-638b8b7ba882_image_png?t=tr/w:132/h:97/m:FitPad",
            email: "farm@1.com", password: "12345678", password_confirmation: "12345678")

restaurant = Restaurant.create(name: "Edgemoor Inn Ltd", street: "Gloucester Road",
                   city: "Stroud", post_code: "GL6 6ND", region: "Gloucestershire",
                   logo: "http://www.yell.comhttp://cdn.yell.com/cdn/yellapi/asset/47F5F723144887C3/thumbnail",
                   email: "rest@1.com", password: "12345678", password_confirmation: "12345678")

farm.items.create(name: "Bakewell", quantity: 200, price: 0.50, category: b,
                  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis quisquam, eius nobis neque amet fuga.")
farm.items.create(name: "Mature Cheddar", quantity: 78, price: 2.99, category: c,
                  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis quisquam, eius nobis neque amet fuga.")
farm.items.create(name: "Ham", quantity: 44, price: 1.79, category: d,
                  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis quisquam, eius nobis neque amet fuga.")
farm.items.create(name: "Apple Cider", quantity: 34, price: 1.39, category: e,
                  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis quisquam, eius nobis neque amet fuga.")
farm.items.create(name: "Steak", quantity: 22, price: 4.88, category: a,
                  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis quisquam, eius nobis neque amet fuga.")

