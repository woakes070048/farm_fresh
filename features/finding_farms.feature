Feature: Finding Farms
  As a restaurant
  I want to be able to find and browse farms near me
  Because I would like to buy goods that can be delivered as fresh as possible

  Background:
    Given I am logged in as a restaurant

  @javascript
  Scenario: View items from a farm near me
    When I navigate to farms near me
      And I click on the first farm
    Then I should see a list of all their items