Given("user do not enter anything in the search input and press search button") do
  find('[action="/en-us/search"] button', match: :first).click
end

Then("Nothing happens, home page is still displayed") do
  expect(current_url).to eq 'https://www.wiley.com/en-us'
end

Given("user enters {string} and do not press search button") do |string|
  fill_in 'pq', with: string
end

Then("area with related content is displayed right under the search header") do
  search_input = find('[action="/en-us/search"] .input-group', match: :first)
  search_result_window = find('.ui-autocomplete.main-navigation-search-autocomplete', match: :first)

  search_result_window_position = search_result_window.native.location.y
  search_input_position = search_input.native.location.y

  # Difference between search input and suggestions popup, no more than 100 px
  expect(search_result_window_position - search_input_position).to be < 100
end

Then("On the {string} section, it has {int} words starting with {string}") do |string, int, string2|
  find('h3', text: string.upcase, match: :first).sibling('.search-list').find('.searchresults-item a', match: :first)
  links = find('h3', text: string.upcase, match: :first).sibling('.search-list').all('.searchresults-item a')
  titles = links.map(&:text)
  expect(titles.count).to eq(4)

  expect(
    titles.any? { |title| title.start_with?(string2.downcase) }
  ).to be(true)
end

Then("On the {string} section, there are {int} titles and each title contain {string} word") do |string, int, string2|

end

Given("click {string} button") do |string|
  search_submit_button = find('[action="/en-us/search"] [type="submit"]', match: :first)
  search_submit_button.click
  find('span.pagination-quantity-text', text: 'Items per page:', match: :first)
end

Then("Only titles containing {string} are displayed") do |string|
  find('.product-title a', match: :first)
  @titles = all('.product-title a').map(&:text)
  expect(@titles.any? { |title| title.include?(string) }).to be(true)
end

Then("there are {int} titles") do |int|
  expect(@titles.count).to eq(int)
end

Then("each title has at least one {string} button") do |string|
  find('.products-list .product-item', match: :first)
  products = all('.products-list .product-item')

  products_has_button = products.map do |product|
    product.find('button', text: 'ADD TO CART', match: :first).visible?
  end

  expect(products_has_button).to be(true)
end
