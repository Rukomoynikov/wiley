Feature: Delay service
  Scenario Outline:
    Given url "https://httpbin.org/delay/<timeout>" has been requested
    Then response status should be "200"
    Then response should delayed to <timeout> seconds 
    
    Examples:
    | timeout |
    | 10 |
    | 5 |
    | 1 |         

  Scenario:
    Given url "https://httpbin.org/delay/" has been requested
    Then response status should be "404"
