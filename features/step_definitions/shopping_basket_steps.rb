When(/^I navigate to a product page$/) do
  visit item_path(id: Item.first)
end

When(/^I click the 'Add to basket' button$/) do
  click_link "Add to Basket"
end

Then(/^I should see the number change in the basket icon$/) do
  within(".navbar .basket") do
    expect(page.css("#count").to eq "1"
  end
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

Then(/^I should no longer see that item in my basket$/) do
  expect(page.css(".itemsContainer .item").count).to be 0
end

When(/^I change the quantity to (\d+)$/) do |quantity|
  fill_in(".itemQuantity"), with: quantity
end

When(/^I navigate to to my basket$/) do
  visit baskets_path
end

Then(/^I should see a product with a quantity of (\d+)$/) do |quantity|
  within(".itemsContainer .item").first do
    expect(page.css(".itemQuantity")).to be "100"
  end
end

When(/^I edit the quantity for the first item in my basket to (\d+)$/) do |quantity|
  within(".itemsContainer .item").first do
    fill_in(".itemQuantity"), with: quantity
  end
end

Then(/^I should see the the quantity for the first item as (\d+)$/) do |quantity|
  within(".itemsContainer .item").first do
    fill_in(".itemQuantity"), with: quantity
  end
end