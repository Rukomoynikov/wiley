Given("he goes to {string} top menu, select {string}") do |string, string2|
  find(".dropdown-submenu a", :text => string, match: :first).hover
  find(".dropdown-item a", :text => string2, match: :first).click
end

Then("{string} items are displayed under {string} on the left side of the screen") do |string, string2|
  find('.side-panel ul li a', match: :first)
  @left_menu_items = all('.side-panel ul li a')
  expect(@left_menu_items.count).to eq(13)
end

Then("the texts are in {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}") do |*args|
  expect(@left_menu_items.map(&:text)).to eq(args)
end
