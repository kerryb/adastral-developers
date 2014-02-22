Feature: Contact page
  Scenario: Viewing contact information
    When I go to the contact page
    Then I should have to log in
    When I have logged in
    Then I should see the contact details
