Feature: Managing Orders as a buyer
  As a restaurant
  I want be able to easily buy items
  Because I normally know what I need and just need to quickly order it

  Background:
    Given I am logged in as a restaurant

  Scenario: Purchasing items in basket
    Given that I have successfully placed an order
    When I navigate to my orders page
    Then I should see the order in my order history at the top

  # @javascript
  # Scenario: Receiving an order confirmation email
  #   Given I have successfully placed an order
  #   When I open the email
  #   Then I should see an order confirmation message and order number
  #     And I should be able to click on a link to be taken to my order

  # @javascript
  # Scenario: Trying to add more quantity than the Farm has available
  #   Given I have one item in my basket
  #   When I change the quantity to a higher value than the quantity in stock
  #     And I click the 'Update Changes' button
  #   Then I should get a message about the quantity being too high
  #     And the quantity should be reset to the previous value