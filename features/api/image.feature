Feature: Image service
  Scenario:
    Given url "https://httpbin.org/image/png" has been requested
    Then response status should be "200"
    Then response should has content type "image/png"
