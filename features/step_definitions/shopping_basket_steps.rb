When(/^I navigate to a product page$/) do
  visit product_path(id: Item.first)
end

Then(/^I should see the number change in the basket icon$/) do
  new_basket_count = find("#basketCount").content.to_i
  expect(new_basket_count).to be > @old_basket_count
end

Then(/^I should see a notification that indicates a product has been added$/) do
  expect(page).to have_content "Item added to basket"
end

When(/^I navigate to my basket$/) do
  visit baskets_path
end

When(/^I click the 'Remove' link$/) do
  within(".itemsContainer .item").first do
    click_link "Remove"
  end
end

When(/^I click the 'Add to Basket' link$/) do
  within(".itemsContainer .item").first do
    find(".addToBasket").click
    @old_basket_count = find("#basketCount").content.to_i
  end
end

When(/^I click the "([^"]*)" link$/) do |link|
  click_link link
end

Then(/^I should no longer see that item in my basket$/) do
  expect(page.css(".itemsContainer .item").count).to be 0
end

When(/^I change the quantity to (\d+)$/) do |quantity|
  fill_in "productQuantityInput", with: quantity
end

When(/^I navigate to to my basket$/) do
  visit baskets_path
end

Then(/^I should see a product with a quantity of (\d+)$/) do |quantity|
  within(".itemsContainer .item").first do
    expect(page.css(".productQuantityInput")).to be "100"
  end
end

When(/^I edit the quantity for the first item in my basket to (\d+)$/) do |quantity|
  within(".itemsContainer .item").first do
    fill_in "productQuantityInput", with: quantity
  end
end

Then(/^I should see the the quantity for the first item as (\d+)$/) do |quantity|
  within(".itemsContainer .item").first do
    fill_in "productQuantityInput", with: quantity
  end
end

When(/^I navigate to a category with products$/) do
  expect(page).to have_content "Browse Products"
  click_link "Meat"
  click_link "Chicken"
end
