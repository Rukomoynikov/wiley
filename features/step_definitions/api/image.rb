Then("response should has content type {string}") do |content_type|
  expect(@response.headers["content-type"]).to eq(content_type)
end
