Feature: Inventory Management
  As a farm
  I would like to be able to add, edit and delete items
  Because I would like to manage my stock easily

  @javascript
  Scenario: Viewing my items
    Given I am logged in as a farm
    When I navigate to my items page
    Then I should see a list of all my items

  @javascript
  Scenario: Adding a new product
    Given I am logged in as a farm
    When I navigate to a new product page
      And I fill in the form correctly
      And I click on the 'Save' button
    Then I should see the new product in the items list.

  @javascript
  Scenario: Editing an existing product
    Given I am logged in as a farm
    When I navigate to a product's edit page
      And I change the price
      And I click on the 'Update' button
    Then the product should have the new price

  @javascript
  Scenario: Validating a Form
    Given I am logged in as a farm
    When I navigate to a new product page
      And I fill in the "quantity" field incorrectly with "blah"
      And I fill in the "price" field incorrectly with "blah"
    Then I should not be able to save

  @javascript
  Scenario: Deleting a product
    Given I am logged in as a farm
    When I navigate to my items page
      And I click on the 'Delete' button
      And I click 'Ok' on the dialog box
    Then I should no longer see the product on my items page

  @javascript
  Scenario: Tweeting when adding a new product
    Given that I am signed in with twitter
      And I enabled posting activity to twitter in my dashboard
    When I add a new product
    Then my twitter feed should have a new post with the details of the new product