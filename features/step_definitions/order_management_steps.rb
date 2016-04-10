Given(/^that I have successfully placed an order$/) do
  create_order
end

When(/^I navigate to my orders page$/) do
  visit orders_path
  expect(current_path).to eq orders_path
end

Then(/^I should see the order in my order history at the top$/) do
  expect(page).to have_content "My Orders"
  expect(page).to have_css "orderListContainer"
  expect(page).to have_css "orderItem"
end

