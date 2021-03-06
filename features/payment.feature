@javascript @stripe

Feature: As a Buying User,
  In order to get my food delivered,
  I need to confirm my order by paying through a payment solution

  As a selling User
  In order to see which of my dishes on offer have been purchased
  I need to see payment confirmation through a payment solution

  Background:
    Given that the following users exist
      | first_name  | last_name | email               | address        | username |
      | Philip      | Zudemberg | email@random.com    | Address 14     | Philippo |
    Given the following dishes exists
      | name      | description                                               | price | ready_time | portions |    lat        |     lng       |
      | meatballs | homecooked with love, including mashed potatoes and sauce | 10    | 18:00      | 10       | 35.5332005    |  -79.179632   |
      | taco      | really spicy authentic mexican tacos                      | 10    | 16:00      | 10       | 35.5332005    |  -79.179632   |
    And that there is a session with lat and lng near "somewhere in America"
    And I am on the "landing" page


  Scenario: Buying User pays for the dishes in her order
    When I click the plus button for "taco"
    And I click the "Add dish to order" button
    And I click the plus button for "meatballs"
    And I click the "Add dish to order" button
    And there should be "2" items on the last order
    And I go to the "Checkout" page
    And I click the stripe button
    And I fill in my card details on the stripe form
    And I submit the stripe form
    Then I should see "Thank you for your order <3" on the order confirmation page

  Scenario: User pays for the dishes and then tries to visit checkout screen
    When I click the plus button for "taco"
    And I click the "Add dish to order" button
    And I click the plus button for "meatballs"
    And I click the "Add dish to order" button
    And there should be "2" items on the last order
    And I go to the "Checkout" page
    And I click the stripe button
    And I fill in my card details on the stripe form
    And I submit the stripe form
    Then I should see "Thank you for your order <3" on the order confirmation page
    When I go to the "landing" page
    And I click "Checkout" button
    Then I should see "You have no items in your order"

  Scenario: Redirects to checkout page on error
    And I am on the "landing" page
    When I click the plus button for "taco"
    And I click the "Add dish to order" button
    And I click the plus button for "meatballs"
    And I click the "Add dish to order" button
    And there should be "2" items on the last order
    And I go to the "Checkout" page
    And I click the stripe button
    And I check out but my card is declined
    Then I should see "The card was declined"



