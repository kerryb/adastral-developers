Feature: Login
  Scenario: Front page visible to guests
    Given I am not logged in
    When I visit the site
    Then I should see the home page

  Scenario: Log in
    When I log in
    Then I should see my name in the navbar
