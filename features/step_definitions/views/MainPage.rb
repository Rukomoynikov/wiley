require 'byebug'

Given("user opens main page") do
  visit 'https://www.wiley.com/en-us'
end

And("he closes change country modal") do 
  changeCountryModal = page.find('.modal-title', text: 'UNDETECTED COUNTRY')

  click_button('YES') if changeCountryModal.visible?
end

Then("following links are displayed in the top menu") do
  [
    'WHO WE SERVE',
    'SUBJECTS',
    'ABOUT'
  ].each { |linkText| expect(page).to have_link(linkText) }
end

Given("items under {string} for sub-header") do |string|
  find("a", :text => string).hover
  @submenuItems = find("a", :text => string).sibling('div').all('ul li a')
end

Then("there are 12 items under resources sub-header") do
  expect(@submenuItems.count).to eq(12)
end

And('titles are  “Students”, “Instructors”, “Book Authors”, “Professionals”, “Researchers”, “Institutions”, “Librarians”, “Corporations”, “Societies”, “Journal Editors”,  “Government”') do 
  expected_menu_items = ["Students", "Instructors", "Book Authors", "Professionals", "Researchers", "Institutions", "Librarians", "Corporations", "Societies", "Journal Editors", "Bookstores", "Government"]
  expect(@submenuItems.map(&:text)).to eq(expected_menu_items)
end

Given("user opens {string} page") do |string|
  visit 'https://www.wiley.com/en-us/contactus'
end

Given("clicks on the Wiley logo at the top menu") do
  first('.logo a').click
end

Then("home page is opened") do
  expect(current_url).to eq 'https://www.wiley.com/en-us'
end
