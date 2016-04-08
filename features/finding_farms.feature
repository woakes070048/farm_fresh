Feature: Finding Farms
  As a restaurant
  I want to be able to find and browse farms near me
  Because I would like to buy goods that can be delivered freshest

  Background:
    Given I am logged in as a restaurant

  @javascript
  Scenario: View farms near me on map
    Given I am logged in as a restaurant
    When I navigate to my home page
      And I click on find farms near me
    Then I should see a google maps view
      And I should a see a list of those farms next to the map
      And I should see some pins on the google map