When(/^I click on find farms near me$/) do
  click_link "Farms near me"
  expect(page).to have_content "Farms Near Me"
  expect(current_path).to eq map_path
end

Then(/^I should see a google maps view$/) do
  expect(page).to have_css "#map"
end

Then(/^I should a see a list of those farms next to the map$/) do
  expect(page).to have_css "#farmList"
  expect(page).to have_css ".farmListItem"
end
