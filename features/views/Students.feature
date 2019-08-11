Feature: Students
  Background:
    Given user opens main page
    And he closes change country modal
    And clicks to "Students" menu item

  Scenario: Students page
    Then "https://www.wiley.com/en-us/students" url is opened
    And "Students" header is displayed
    And "Learn More" links are present on the page and direct to  www.wileyplus.com site
