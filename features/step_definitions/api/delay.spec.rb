Given("url {string} has been requested") do |url|
  @time_before = DateTime.now
  @response = HTTParty.get url
  @time_after = DateTime.now
end

Then("response should be after {int} seconds") do |timeout|
  # Possible delay plus 1 second to some network requirements
  expected_delay = timeout + 1
  received_delay = TimeDifference.between(@time_before, @time_after).in_seconds

  expect(received_delay).to be_between(timeout, received_delay)
end
