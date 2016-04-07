Given(/^I am logged in as a farm$/) do
  load_users
  load_categories
  load_items

  visit new_farm_session_path
  fill_in "farm_email", with: "farm@1.com"
  fill_in "farm_password", with: "12345678"
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
  find('#item_category_id').find(:xpath, 'option[1]').select_option
end

When(/^I click on the 'Save' button$/) do
  click_button "Create Item"
end

Then(/^I should see the new product in the items list\.$/) do
  expect(page).to have_content "Apple Pie"
end

When(/^I navigate to a product's edit page$/) do
  visit farm_items_path
  @edit_item_id = page.all(".item").first[:id]
  page.all(".item").first.find_css(".editItemButton").first.click
end

When(/^I change the price$/) do
  fill_in "item_quantity", with: "999"
end

When(/^I click on the 'Update' button$/) do
  click_button "Update Item"
end

Then(/^the product should have the new price$/) do
  qty = page.find_by_id(@edit_item_id).find_css(".itemQuantity").first.visible_text.split(":")[1].strip.to_i
  expect(qty).to be 999
end

When(/^I click on the 'Delete' button$/) do
  visit farm_items_path
  @edit_item_id = page.all(".item").first[:id]
  page.all(".item").first.find_css(".deleteItemButton").first.click
end

When(/^I click 'Ok' on the dialog box$/) do
  # TODO: Implement warning before deleting
end

Then(/^I should no longer see the product on my items page$/) do
  expect(Proc.new {page.find_by_id(@edit_item_id)}).to raise_error Capybara::ElementNotFound
end

When(/^I fill in the "([^"]*)" field incorrectly with "([^"]*)"$/) do |field, text|
  fill_in "item_#{field}", with: text
end

Then(/^I should not be able to save$/) do
  expect(current_path).to eq new_item_path
end