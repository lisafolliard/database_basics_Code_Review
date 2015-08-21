require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('adding a stylist', {:type => :feature}) do
  it('opens with a list of all stylists and allows user to add a stylist') do
    visit('/')
    fill_in('firstname', :with => 'Dawn')
    fill_in('lastname', :with => 'LaCovey')
    click_button("Add Stylist")
    expect(page).to have_content('Dawn')
  end
end

describe('view details about an individual stylist', {:type => :feature}) do
  it('allows user to click on individual stylist link and view details about that stylist') do
    visit('/')
    fill_in('firstname', :with => 'Dawn')
    fill_in('lastname', :with => 'LaCovey')
    click_button("Add Stylist")
    click_link('Dawn LaCovey')
    expect(page).to have_content('LaCovey')
  end
end

describe('how to update details about a stylist', {:type => :feature}) do
  it('allows user to update details about a stylist') do
    visit('/')
    fill_in('firstname', :with => 'Deen')
    fill_in('lastname', :with => 'LaCovey')
    click_button("Add Stylist")
    click_link('Deen LaCovey')
    click_link('Edit')
    fill_in('firstname', :with => 'Dawn')
    click_button('Save')
    expect(page).to have_content('Dawn')
  end
end
#
# describe('add new client to a stylist', {:type => :feature}) do
#   it('allows user to add clients to stylists') do
#     new_stylist = Stylist.new({:firstname => 'Dawn', :lastname => 'LaCovey', :id => nil})
#     new_stylist.save()
#     visit('/')
#     click_link(new_stylist.firstname())
#     fill_in('description', :with => 'finish project')
#     fill_in('due date', :with => '2015-9-1')
#     click_button('Add Task!')
#     expect(page).to have_content('finish project')
#   end
# end

# describe('how to delete a stylist', {:type => :feature}) do
#   it('allows user to delete a stylist') do
#     visit('/')
#     fill_in('firstname', :with => 'Deen')
#     fill_in('lastname', :with => 'LaCovey')
#     click_button("Add Stylist")
#     click_link('Dawn LaCovey')
#     click_button('Delete Stylist')
#     # expect(page).should_not have_content('Dawn LaCovey')
#     expect(page).has_content?('Dawn LaCovey') == false
#   end
# end
