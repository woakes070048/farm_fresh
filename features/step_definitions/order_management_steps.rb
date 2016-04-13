Given(/^that I have successfully placed an order$/) do
  create_order
end

When(/^I navigate to my orders page$/) do
  visit orders_path
  expect(current_path).to eq orders_path
end

Then(/^I should see the order in my order history at the top$/) do
  expect(page).to have_content "My Orders"
  expect(page).to have_css ".orderDetails"
  expect(page).to have_css ".orderDate"
  expect(page).to have_content "Order number:"
end

Given(/^I have previously placed an order$/) do
  create_order
end

When(/^I navigate to my order history page$/) do
  visit orders_path
end

Then(/^I should see an order item with the status text 'In Progress'$/) do
  expect(page).to have_css ".orderStatus"
  expect(page).to have_content "Status:"
  expect(page).to have_content "In Progress"
end

