Feature: Education
  Background:
    Given user opens main page
    And he closes change country modal
    And he goes to "SUBJECTS" top menu, select "Education"

  Scenario Outline: Education page
    Then "13" items are displayed under "Subjects" on the left side of the screen
    And the texts are in <menu_item_texts>
    
    Examples:
    | menu_item_texts |
    | "Information & Library Science", "Education & Public Policy", "K-12 General", "Higher Education General", "Vocational Technology", "Conflict Resolution & Mediation (School settings)", "Curriculum Tools- General", "Special Educational Needs", "Theory of Education", "Education Special Topics", "Educational Research & Statistics", "Literacy & Reading", "Classroom Management" |
                    
