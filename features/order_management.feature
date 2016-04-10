Feature: Managing Orders as a buyer
  As a restaurant
  I want be able to easily buy items
  Because I normally know what I need and just need to quickly order it

  Background:
    Given I am logged in as a restaurant

  @javascript
  Scenario: Purchasing items in basket
    Given that I have some items in my basket
      And I navigate to the basket page
    When I click the "Checkout" link
      And I enter my credit card details
      And I successfully submit the order
    Then I should see the order in my order history at the top

  # @javascript
  # Scenario: Receiving an order confirmation email
  #   Given I have successfully placed an order
  #   When I open the email
  #   Then I should see an order confirmation message and order number
  #     And I should be able to click on a link to be taken to my order

  # @javascript
  # Scenario: Checking order status in order history
  #   Given I have previously placed an order
  #   When I navigate to my order history page
  #   Then I should see an order item with the status text 'In Progress'

  # @javascript
  # Scenario: Trying to add more quantity than the Farm has available
  #   Given I have one item in my basket
  #   When I change the quantity to a higher value than the quantity in stock
  #     And I click the 'Update Changes' button
  #   Then I should get a message about the quantity being too high
  #     And the quantity should be reset to the previous value