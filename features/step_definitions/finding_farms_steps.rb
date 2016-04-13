When(/^I click on find farms near me$/) do
  click_link "Farms near me"
  expect(page).to have_content "Farms Near Me"
  expect(current_path).to eq map_path
end

Then(/^I should see a google maps view$/) do
  expect(page).to have_css "#map"
end

Then(/^I should a see a list of those farms next to the map$/) do
  expect(page).to have_css "#farmList"
  expect(page).to have_css ".farmListItem"
end

When(/^I navigate to farms near me$/) do
  visit map_path
end

When(/^I click on the first farm$/) do
  find(".viewItemsButton").click
end

Then(/^I should see a list of all their items$/) do
  expect(page).to have_content "Items from"
  expect(current_path).to start_with "/farms"
  expect(current_path).to end_with "items"
  expect(page).to have_css "#productsContainer"
  expect(page).to have_css ".itemPrice"
  expect(page).to have_css ".itemQty"
end
