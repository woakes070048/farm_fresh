When(/^I click on find farms near me$/) do
  click_link "Farms near me"
end

Then(/^I should see a google maps view with pins for local farms$/) do
  expect(current_path).to eq map_path
end

Then(/^I should a see a list of those farms next to the map$/) do
  expect(page).to have_css "#farmListContainer"
  expect(page).to have_css ".farmListItem"
end

Then(/^I should see some pins on the google map$/) do
  expect(page).to have_css '#markers img'
end