require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a stylist', {:type => :feature}) do
  it('opens with a list of all stylists and allows user to add a stylist') do
    visit('/')
    fill_in('name', :with => 'Dawn LaCovey')
    click_button("Add Stylist")
    expect(page).to have_content('Dawn LaCovey')
  end
end

describe('view details about an individual stylist', {:type => :feature}) do
  it('allows user to click on individual stylist link and view details about that stylist') do
    visit('/')
    fill_in('name', :with => 'Dawn LaCovey')
    click_button("Add Stylist")
    click_link('Dawn LaCovey')
    expect(page).to have_content('Dawn LaCovey')
  end
end

describe('how to update details about a stylist', {:type => :feature}) do
  it('allows user to update details about a stylist') do
    visit('/')
    fill_in('name', :with => 'Deen LaCovey')
    click_button("Add Stylist")
    click_link('Deen LaCovey')
    click_link('Edit')
    fill_in('name', :with => 'Dawn LaCovey')
    click_button('Save')
    expect(page).to have_content('Dawn LaCovey')
  end
end

describe('how to delete a stylist', {:type => :feature}) do
  it('allows user to delete a stylist') do
    visit('/')
    fill_in('name', :with => 'Dawn LaCovey')
    click_button("Add Stylist")
    click_link('Dawn LaCovey')
    click_button('Delete Stylist')
    expect(page).should_not have_content('Dawn LaCovey')
    # expect(page).has_content?('Dawn LaCovey') == false
  end
end
