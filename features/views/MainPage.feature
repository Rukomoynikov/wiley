Feature: Main page
  Background:
    Given user opens main page
    And he closes change country modal

  Scenario: Main menu  
    Then following links are displayed in the top menu

  Scenario: Submenu for who we serve
    Given items under "WHO WE SERVE" for sub-header
    Then there are 12 items under resources sub-header
    And titles are  “Students”, “Instructors”, “Book Authors”, “Professionals”, “Researchers”, “Institutions”, “Librarians”, “Corporations”, “Societies”, “Journal Editors”,  “Government”

  Scenario: Logo leads to main page
    Given user opens "Contacts" page
    And clicks on the Wiley logo at the top menu
    Then home page is opened
