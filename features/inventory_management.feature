Feature: Inventory Management
  As a farm
  I would like to be able to add, edit and delete items
  Because I would like to manage my stock easily

  Background:
    Given I am logged in as a farm

  Scenario: Viewing my items
    When I navigate to my items page
    Then I should see a list of all my items

  Scenario: Adding a new product
    When I navigate to a new product page
      And I fill in the form correctly
      And I click on the 'Save' button
    Then I should see the new product in the items list.

  Scenario: Editing an existing product
    When I navigate to a product's edit page
      And I change the price
      And I click on the 'Update' button
    Then the product should have the new price

  Scenario: Validating a Form
    When I navigate to a new product page
      And I fill in the "quantity" field incorrectly with "blah"
      And I fill in the "price" field incorrectly with "blah"
    Then I should see a error message for "nvalid quantity"
      And I should see a error message for "invalid price"

  Scenario: Deleting a product
    When I navigate to my items page
      And I click on the 'Delete' button
      And I click 'Ok' on the dialog box
    Then I should no longer see the product on my items page