Given(/^I am logged in as a restaurant$/) do
  load_users
  load_categories
  load_items


  visit new_restaurant_session_path
  fill_in "restaurant_email", with: "rest@1.com"
  fill_in "restaurant_password", with: "12345678"
  click_button 'Log in'
  expect(page).to have_content "Sign Out"
end

When(/^I navigate to my home page$/) do
  visit restaurant_root_path
end

Then(/^I should see a list of top level categories on the left$/) do
  expect(page).to have_content "Bakery"
end

When(/^I click on the "([^"]*)" category$/) do |category|
  click_link category
end

Then(/^I should see "([^"]*)" and "([^"]*)" sub categories$/) do |category1, category2|
  expect(page).to have_content category1
  expect(page).to have_content category2
end

When(/^I go click on the "([^"]*)" button$/) do |button|
  click_link button
end