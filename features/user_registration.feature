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

  Scenario: Restaurant Signing up with twitter
    When I navigate to the home page
      And I click "The Sign in with twitter" button
      And I am redirected to the twitter sign up page
      And I click the "Accept" button
    Then I should be taken to the restaurant home page

  Scenario: Farm Signing up with twitter
    When I navigate to the home page
      And I click "The Sign in with twitter" button
      And I am redirected to the twitter sign up page
      And I click the "Accept" button
    Then I should be taken to the Farm dashboard