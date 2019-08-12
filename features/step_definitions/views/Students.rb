And("clicks to {string} menu item") do |string|
  find('a', text: string, visible: true).click
end

Then("{string} url is opened") do |string|
  expect(current_url).to eq(string)
end

Then("{string} header is displayed") do |string|
  expect(find('.sg-title-h1', match: :first).text).to eq(string)
end

Then("{string} links are present on the page and direct to  www.wileyplus.com site") do |string|
  find('a', text: string, match: :first)
  learn_more_links = all('a', text: string)
  urls = learn_more_links.map { |link| link[:href] }
  all_leads_to_wiley = urls.any? { |url| url.start_with?(/http:\/\/www\.wiley(plus)?\.com/) }
  expect(all_leads_to_wiley).to be(true)
end
