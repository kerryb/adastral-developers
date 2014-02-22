Feature: Admin security
  Scenario: Admin users can see the admin site
    Given I am logged in
    And I am an admin
    Then I should be able to access the admin site

  Scenario: Non-admin users can't see the admin site
    Given I am logged in
    And I am not an admin
    Then there should not be an admin link in the navbar
    And I should not be able to access the admin site
