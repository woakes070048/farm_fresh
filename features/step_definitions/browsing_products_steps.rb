
When(/^I click on the 'Chicken' category$/) do
  click_link "Meat"
  click_link "Chicken"
end

Then(/^I should see a list of all the products in that category$/) do
  expect(page).to have_css(".itemsContainer")
  expect(page).to have_css(".item")
  expect(page.first(".item")).to have_css(".itemName")
  expect(page.first(".item")).to have_css(".itemDescription")
  expect(page.first(".item")).to have_css(".itemPrice")
  expect(page.first(".item")).to have_css(".itemQty")
end

When(/^I click on a quantity sort button$/) do
  # find("sortSelection").find(:xpath, "option[1]").select_option
  find('#sortSelection').find(:xpath, 'option[3]').select_option
end

Then(/^I should see the products with the most quantity on top$/) do
  first_qty = page.all(".item").first.find_css(".itemQty").first.visible_text.gsub("\"", "").to_i
  last_qty = page.all(".item").first.find_css(".itemQty").first.visible_text.gsub("\"", "").to_i
  expect(first_qty).to be >= last_qty
end

When(/^I click on a price sort button$/) do
  find('#sortSelection').find(:xpath, 'option[2]').select_option
end

Then(/^I should see the products with the highest price on top$/) do
  first_price = page.all(".item").first.find_css(".itemPrice").first.visible_text.gsub("\"", "").to_f
  last_price = page.all(".item").last.find_css(".itemPrice").first.visible_text.gsub("\"", "").to_f
  expect(first_price).to be >= last_price
end

When(/^I click on the first product$/) do
  page.first(".button").click
end

Then(/^I should be taken to the product page$/) do
  expect(page).to have_content("Add to Basket")
  expect(current_path).to start_with "/product"
end

Then(/^I should see pictures$/) do
  expect(page).to have_css(".productImages")
end

Then(/^I should see a price$/) do
  expect(page).to have_css(".productPrice")
end

Then(/^I should see an 'Add to Basket' button$/) do
  expect(page).to have_content("Add to Basket")
end