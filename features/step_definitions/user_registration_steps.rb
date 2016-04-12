Given(/^I am not signed in$/) do
  visit root_path
  click_link "Sign Out" if page.has_content? "Sign Out"
end

When(/^I navigate to the Restaurant signup page$/) do
  visit new_restaurant_registration_path
end

When(/^I fill in the "([^"]*)" form correctly$/) do |user_type|
  fill_in "#{user_type}_name", with: "Test Store"
  fill_in "#{user_type}_email", with: "test@#{user_type}.com"
  fill_in "#{user_type}_password", with: "12345678"
  fill_in "#{user_type}_password_confirmation", with: "12345678"
  fill_in "#{user_type}_street", with: "School Plantation,"
  fill_in "#{user_type}_city", with: "Worcester"
  fill_in "#{user_type}_post_code", with: "WR6 6NF"
  fill_in "#{user_type}_region", with: "Worcestershire"
  click_button 'Sign up'
end

Then(/^I should be taken to the restaurants home page$/) do
  expect(current_path).to eq restaurant_root_path
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

When(/^I navigate to the farm sign up page$/) do
  visit new_farm_registration_path
end

When(/^I follow "([^"]*)"$/) do |link|
  visit "/farms/auth/twitter"
  fill_in "username_or_email", with: "farm_user"
  fill_in "password", with: "a12345678"
  click_button "Sign In"
end

Then(/^I should be taken to my home page$/) do
  expect(page).to have_content "Farm Fresh"
  expect(current_path).to eq "/"
end

