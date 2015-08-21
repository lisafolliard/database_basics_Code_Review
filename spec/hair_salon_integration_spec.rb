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
