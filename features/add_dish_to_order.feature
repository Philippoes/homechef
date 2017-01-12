Feature: Add dish to order
  As a buying User,
  In order to purchase a dish
  I need to be able to first add the dish to my order list

  Background:
    Given the following dishes exists
      |    name   |                        description                              |  price  | ready_time | portions |
      | meatballs |    homecooked with love, including mashed potatoes and sauce    |    49   |   18:00    |    10    |
      |   taco    |    really spicy authentic mexican tacos                         |    59   |   16:00    |    10    |

  Scenario: Successfully add dish to order
    When I am on the "landing" page
    And I focus on dish "meatballs"
    And I click the "Add dish" button for
    Then I should see "Successfully added to order"

  #keep these steps in mind for code on row 15
   # create a new buyingorderlist
   # edit it by adding the "meatballs" dish = orderitem
   # if there is no sellingorderslist, create a sellingorderlist
   # and edit it by adding the "meatballs" dish
   # otherwise add "meatballs" to the existing sellingorderslist
   # stay on the same page