Given(/^I am logged in as a farm$/) do
  load_users
  load_categories
  load_items


  visit new_restaurant_session_path
  fill_in "restaurant_email", with: "farm@1.com"
  fill_in "restaurant_password", with: "12345678"
  click_button 'Log in'
  expect(page).to have_content "Sign Out"
end

When(/^I navigate to my items page$/) do
  visit farm_items_path
end

Then(/^I should see a list of all my items$/) do
  expect(page).to have_content "My Items"
end

When(/^I navigate to a new product page$/) do
  visit new_item_path
end

When(/^I fill in the form correctly$/) do
  fill_in "item_name", with: "Apple Pie"
  fill_in "item_description", with: "Sweet Apple Pie"
  fill_in "item_price", with: "2.49"
  fill_in "item_quantity", with: "57"
  find('#categorySelection').find(:xpath, 'option[3]').select_option
end

When(/^I click on the 'Save' button$/) do
  click_button "Save"
end

Then(/^I should see the new product in the items list\.$/) do
  expect(page).to have_content "Apple Pie"
end

When(/^I navigate to a product's edit page$/) do
  visit farm_items_path
  page.all(".item").first.find_css(".productEditButton").click
end

When(/^I change the price$/) do
  fill_in "item_quantity", with: "999"
end

When(/^I click on the 'Update' button$/) do
  click_button "Update"
end

Then(/^the product should have the new price$/) do
  qty = page.all(".item").first.find_css(".itemQty").first.visible_text.to_i
  expect(qty).to be 999
end

When(/^I click on the 'Delete' button$/) do
 farm_items_path
 @name = page.all(".item").first.find_css(".itemName").first.visible_text
 page.all(".item").first.find_css(".productDeleteButton").click
end

When(/^I click 'Ok' on the dialog box$/) do
  # TODO: Implement warning before deleting
end

Then(/^I should no longer see the product on my items page$/) do
  expect(page).to_not have_content @name
end

When(/^I fill in the "([^"]*)" field incorrectly with "([^"]*)"$/) do |field, text|
  fill_in "item_#{field}", with: text
end

Then(/^I should see a error message for "([^"]*)"$/) do |error_message|
  expect(page).to have_content error_message
end