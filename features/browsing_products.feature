Feature: Browsing Products
  As a restaurant
  I want to be able to browse through products
  Because I want to be able see what's available to buy

  Background:
    Given I am logged in as a restaurant
      And I navigate to my home page

  @javascript
  Scenario: Browsing a list of products
    When I click on the 'Chicken' category
    Then I should see a list of all the products in that category

  @javascript
  Scenario: Sorting products by quantity
    When I click on the 'Chicken' category
     And I click on a quantity sort button
    Then I should see the products with the most quantity on top

  # Scenario: Sorting products by price
  #   When I click on the 'Chicken' category
  #    And I click on a price sort button
  #   Then I should see the products with the highest price on top

  # Scenario: Viewing a product
  #   When I click on the 'Chicken' category
  #     And I click on the first product
  #   Then I should be taken to the product page
  #     And I should see pictures
  #     And I should see a price
  #     And I should see an 'Add to Basket' button