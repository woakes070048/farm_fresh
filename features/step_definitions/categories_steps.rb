Given(/^I am logged in as a restaurant$/) do
  user = Restaurant.create(name:                  "Top Pastries",
                           email:                 "top@pas.com",
                           password:              "12345678",
                           password_confirmation: "12345678")

  visit new_restaurant_session_path
  fill_in "restaurant_email",    with: user.email
  fill_in "restaurant_password", with: "12345678"
end

When(/^I navigate to my home page$/) do
  visit restaurant_root_path
end

Then(/^I should see a list of categories on the left$/) do

end

When(/^I click on the "([^"]*)" category$/) do |arg1|

end

Then(/^I should see "([^"]*)" and "([^"]*)" sub categories$/) do |arg1, arg2|

end