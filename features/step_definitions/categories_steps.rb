Given(/^I am logged in as a restaurant$/) do
  restaurant = Restaurant.create(name: "Edgemoor Inn Ltd", street: "Gloucester Road",
                   city: "Stroud", post_code: "GL6 6ND", region: "Gloucestershire",
                   logo: "http://www.yell.comhttp://cdn.yell.com/cdn/yellapi/asset/47F5F723144887C3/thumbnail",
                   email: "rest@1.com", password: "12345678", password_confirmation: "12345678")
  Category.create(name: "Bakery")

  visit new_restaurant_session_path
  fill_in "restaurant_email", with: "rest@1.com"
  fill_in "restaurant_password", with: "12345678"
  click_button 'Log in'
end

When(/^I navigate to my home page$/) do
  visit restaurant_root_path
end

Then(/^I should see a list of top level categories on the left$/) do
  expect(page).to have_content "Bakery"
  # expect(page).to have_content "Dairy"
  # expect(page).to have_content "Deli"
  # expect(page).to have_content "Drinks"
  # expect(page).to have_content "Fish"
  # expect(page).to have_content "Fruit"
  # expect(page).to have_content "Veg"
  # expect(page).to have_content "Meat"
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