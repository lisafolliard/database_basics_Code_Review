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
