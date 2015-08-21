# require('client')
require('stylist')
require('rspec')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
    DB.exec("DELETE FROM stylists *;")
  end
end

describe(Stylist) do

  describe('#initialize') do
    it('adds a new stylist') do
      new_stylist = Stylist.new({:firstname => 'Dawn', :lastname => 'LaCovey', :id => nil})
      new_stylist.save()
      expect(new_stylist.firstname()).to(eq('Dawn'))
    end
  end

  describe('.all') do
    it('should be empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end














end #spec end
