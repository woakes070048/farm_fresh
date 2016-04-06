
When(/^I click on the 'Chicken' category$/) do
  click_link "Meat"
  click_link "Chicken"
end

Then(/^I should see a list of all the products in that category$/) do
  expect(page).to have_css(".itemContainer")
  expect(page).to have_css(".item")
  expect(page.first(".item")).to have_content "£"
end

When(/^I click on a quantity sort button$/) do
  # find("#sortOption").find(:xpath, "option[1]").select_option
  expect(page).to have_css "#sortOption"
  select "Quantity", from: "#sortOption"
end

Then(/^I should see the products with the most quantity on top$/) do
  first_qty = page.first(".item").find_css(".qty").gsub("£", "")
  last_qty = page.last(".item").find_css(".qty").gsub("£", "")
  expect(first_qty).to > last_qty
end

When(/^I click on a price sort button$/) do
  expect(page).to have_css "#sortOption"
  select "Price", from: "#sortOption"
end

Then(/^I should see the products with the highest price on top$/) do
  first_price = page.first(".item").find_css(".price").gsub("£", "")
  last_price = page.last(".item").find_css(".price").gsub("£", "")
  expect(first_price).to > last_price
end

When(/^I click on the first product$/) do
  page.first(".item").click
end

Then(/^I should be taken to the product page$/) do
  expect(page).to have_content("Add to Basket")
end

Then(/^I should see pictures$/) do
  expect(page).to have_css(".productImage")
end

Then(/^I should see a price$/) do

end

Then(/^I should see an 'Add to Basket' button$/) do

end