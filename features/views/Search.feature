Feature: Search
  Background:
    Given user opens main page
    And he closes change country modal

  Scenario: Empty search 
    Given user do not enter anything in the search input and press search button
    Then Nothing happens, home page is still displayed

  Scenario: Search suggestions
    Given user enters "Java" and do not press search button
    Then area with related content is displayed right under the search header
    Then On the "Suggestions" section, it has 4 words starting with "Java"
    Then On the "Products" section, there are 5 titles and each title contain "Java" word

  Scenario: Search page
    Given user enters "Java" and do not press search button
    And click "SEARCH" button
    Then Only titles containing "Java" are displayed
    Then there are 10 titles
    # Then each title has at least one "Add to Cart" button
