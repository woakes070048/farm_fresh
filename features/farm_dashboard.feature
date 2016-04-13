Feature: Farm Dashboard
  As a farm
  I want to be able to see the most important stats on one page
  Because I want to see the state of my Farm Fresh account at a glance

  Background:
    Given I am logged in as a farm
      And I have at least one order

  Scenario: Showing graphs for common stats e.g. Sales in the last 7 days and pie chart of products sold as a percentage
    When I navigate to my home page
    Then I should see a line graph showing sales data for the last 7 days
      And I should see a pie chart showing where my sales are coming from


  # Scenario: Showing indication of new orders
  #   When I navigate to my home page
  #   Then I should see a clickable link with the number of new orders
  #     And I should be able to click the link
  #     And I should be taken to the orders page which will be filterd by 'Unfulfilled'