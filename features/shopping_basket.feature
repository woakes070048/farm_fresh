Feature: Shopping Basket
  As a restaurant
  I want to be able to add items to my basket and delete items from my basket
  Because I want to be able to manage my basket before checking out

  Background:
  Given I am logged in as a restaurant

  @javascirpt
  Scenario: Adding prodcut to the basket
    When I navigate to a category with products
      And I fill in the first item's quantity with 10
      And I click the 'Add to Basket' link
    Then I should see the number change in the basket icon
      And I should see a notification that indicates a product has been added

  # @javascirpt
  # Scenario: Removing items from the basket
  #   When I navigate to my basket
  #     And I click the 'Remove' link
  #   Then I should no longer see that item in my basket

  # @javascirpt
  # Scenario: Editing quantity before adding to basket
  #   When I navigate to a product page
  #     And I change the quantity to 100
  #     And I click the "Add to Basket" link
  #     And I navigate to to my basket
  #   Then I should see a product with a quantity of 100

  # @javascirpt
  # Scenario: Editing quantity in basket
  #   When I navigate to my basket
  #     And I edit the quantity for the first item in my basket to 10
  #     And I click the "Update" link
  #     And I navigate to to my basket
  #   Then I should see the the quantity for the first item as 10