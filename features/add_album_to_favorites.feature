Feature: Add album to favorites
  1. go to http://juke.com/
  2. accept cookies and navigate to <registration page>
  3. register user using email / password
  4. check that user is created
  5. navigate to site's <homepage>
  6. add banner album to favorites (click star icon)
  7. check that icon is highlighted
  8. navigate to <favorites>
  9. check that correct album is present

  Scenario: Accent cookies and navigate to <registration page>
    Given I am on the Home Page
    When I accept cookies and click registration
    Then The Registration Page should be opened

  Scenario: Register user
    Given I am on the Registration Page
    When I fill email and password fields
    Then User is being created

  Scenario: Add album to favorites
    Given I am on the Home Page
    When Add album to favorites
    Then The icon should be highlighted

  Scenario: Verify album in favorites
    Given I get my favorite album
    When I navigate to favorites
    Then Verify that correct album is present