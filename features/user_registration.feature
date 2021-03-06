Feature: User Registration
  As an unregistered user
  I would like to sign up
  Because I would like to use the Farm Fresh service

  Background:
    Given I am not signed in

  Scenario: Restaurant Signing up
    When I navigate to the Restaurant signup page
      And I fill in the "restaurant" form correctly
    Then I should be taken to the restaurants home page

  Scenario: Farm Signing up
    When I navigate to the Farm signup page
      And I fill in the "farm" form correctly
    Then I should be taken to the farm dashboard

  @javascript
  Scenario: Farm Signing up with twitter
    When I navigate to the farm sign up page
      And I follow "Sign in with Twitter"
    Then I should be taken to my home page
