Given(/^I have at least one order$/) do
  create_multiple_orders
  expect(Restaurant.find_by(email: "rest@1.com").orders.count).to be >= 1
end

Then(/^I should see a line graph showing sales data for the last (\d+) days$/) do |arg1|
  expect(page).to have_css "#sevenDaySales"
end

Then(/^I should see a pie chart showing where my sales are coming from$/) do
  expect(page).to have_css "#salesDistribution"
end