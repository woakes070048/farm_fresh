Given(/^that I have some items in my basket$/) do
  restaurant = Restaurant.first
  restaurant.basket_items.create(item: Item.first, quantity: 20)
  restaurant.basket_items.create(item: Item.last, quantity: 30)
end

Given(/^I navigate to the basket page$/) do
 visit baskets_path
end

When(/^I enter my credit card details$/) do
  expect(current_path).to be checkouts_path
  fill_in "creditcard" ,with: "424242424242424242424"
  fill_in "date", with: "blash"
end

When(/^I successfully submit the order$/) do
  click_link "Submit"
end

Then(/^I should see the order in my order history at the top$/) do
  visit orders_path
  expect(page).to have_content "My Orders"
  expect(page).to have_css("orderItem")
  expect(page).to have_css("orderNumber")
end
