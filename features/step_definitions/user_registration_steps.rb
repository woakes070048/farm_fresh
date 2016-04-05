Given(/^I am not signed in$/) do
  visit root_path
  click_link "Sign Out" if page.has_content? "Sign Out"
end

When(/^I navigate to the Restaurant signup page$/) do
  visit new_restaurant_registration_path
end

When(/^I fill in the "([^"]*)" form correctly$/) do |user_type|
  fill_in "#{user_type}_email", with: "test@#{user_type}.com"
  fill_in "#{user_type}_password", with: "12345678"
  fill_in "#{user_type}_password_confirmation", with: "12345678"
end

Then(/^I should be taken to the restaurants home page$/) do
  expect(current_path).to eq "/"
  expect(page).to have_content "Sign Out"
  expect(page).to have_content "Restaurant Home Page"
end

When(/^I navigate to the Farm signup page$/) do
  visit new_farm_registration_path
end

Then(/^I should be taken to the farm dashboard$/) do
  expect(current_path).to eq "/"
  expect(page).to have_content "Sign Out"
  expect(page).to have_content "Farm Dashboard"
end

When(/^I navigate to the home page$/) do
  pending
end

When(/^I click "([^"]*)" button$/) do |arg1|
  pending
end

When(/^I am redirected to the twitter sign up page$/) do
  pending
end

When(/^I click the "([^"]*)" button$/) do |arg1|
  pending
end

Then(/^I should be taken to the restaurant home page$/) do
  pending
end

Then(/^I should be taken to the Farm dashboard$/) do
  pending
end

