# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.destroy_all

p1 = Category.create(name: "Bakery")
Category.create(name: "Bread" ,parent: p1)
Category.create(name: "Cakes" ,parent: p1)
Category.create(name: "Biscuits" ,parent: p1)
Category.create(name: "Pies" ,parent: p1)

p1 = Category.create(name: "Dairy")
Category.create(name: "Cheese" ,parent: p1)
Category.create(name: "Milk & Yoghurt" ,parent: p1)
Category.create(name: "Butter & Cream" ,parent: p1)
Category.create(name: "Eggs" ,parent: p1)

p1 = Category.create(name: "Deli")
Category.create(name: "Meat Products" ,parent: p1)
Category.create(name: "Non-meat Products" ,parent: p1)
Category.create(name: "Olives" ,parent: p1)
Category.create(name: "Oils & Vinegars" ,parent: p1)

p1 = Category.create(name: "Drinks")
Category.create(name: "Wine" ,parent: p1)
Category.create(name: "Beers & Cider" ,parent: p1)
Category.create(name: "Spirits" ,parent: p1)
Category.create(name: "Juices & Soft Drinks" ,parent: p1)

p1 = Category.create(name: "Fish")
Category.create(name: "White and Oily fish" ,parent: p1)
Category.create(name: "Smoked" ,parent: p1)
Category.create(name: "Shellfish" ,parent: p1)
Category.create(name: "Salmon" ,parent: p1)


p1 = Category.create(name: "Fruit")
Category.create(name: "Apples & Pears" ,parent: p1)
Category.create(name: "Soft Fruit" ,parent: p1)
Category.create(name: "Dried" ,parent: p1)
Category.create(name: "Preserves" ,parent: p1)

p1 = Category.create(name: "Veg")
Category.create(name: "Seasonal" ,parent: p1)
Category.create(name: "Salads & Herbs" ,parent: p1)
Category.create(name: "Mushrooms" ,parent: p1)
Category.create(name: "Root Vegetables" ,parent: p1)

p1 = Category.create(name: "Meat")
Category.create(name: "Beef" ,parent: p1)
Category.create(name: "Lamb" ,parent: p1)
Category.create(name: "Game" ,parent: p1)
Category.create(name: "Poultry" ,parent: p1)
