Feature: Delay service
  Scenario Outline:
    Given url "https://httpbin.org/delay/<timeout>" has been requested
    Then response should be after <timeout> seconds 
    
    Examples:
    | timeout |
    | 10 |
    | 1 |
                    
