Feature: Add dish to order
  As a buying User,
  In order to purchase a dish
  I need to be able to first add the dish to my order list

  Scenario: Successfully add dish to order
    Given I am on the "landing" page
    When I click the "Add dish" button
#    Then the selected dish should be added to my order list