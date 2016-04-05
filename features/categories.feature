Feature: Navigating Categories
  As a restaurant
  I want to be able to navigate the categories of products
  Because I want to be able to find a specific type of product

  Background:
    Given I am logged in as a restaurant

  @javascript
  Scenario: Viewing top level categories
    When I navigate to my home page
    Then I should see a list of top level categories on the left

  @javascript
  Scenario: Navigating to sub categories
    When I navigate to my home page
      And I click on the "Poultry" category
    Then I should see "Chicken" and "Turkey" sub categories

