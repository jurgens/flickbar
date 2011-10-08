Feature: Login
  As a visitor I want to login into the app

  Scenario: New user click on "Login" and login into the site
    Given I am on the home page
    When I follow "Login"
    Then I should see "Success"
