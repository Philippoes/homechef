@javascript @stripe

Feature: As a Buying User,
  In order to get my food delivered,
  I need to confirm my order by paying through a payment solution

  As a selling User
  In order to see which of my dishes on offer have been purchased
  I need to see payment confirmation through a payment solution

  Background:
  Given the following dishes exists
  | name      | description                                               | price | ready_time | portions |
  | meatballs | homecooked with love, including mashed potatoes and sauce | 10    | 18:00      | 10       |
  | taco      | really spicy authentic mexican tacos                      | 10    | 16:00      | 10       |

  And there are two dishes in my order

  Scenario: Buying User pays for the dishes in her order
    When I am on the "Checkout" page
    And I click the stripe button
    And I fill in my card details on the stripe form
    And I submit the stripe form
    Then I should see "Thanks, you paid $20.00!" on the order confirmation