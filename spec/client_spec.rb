# require('spec-helper')

require('client')
# require('stylist')
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

describe(Client) do

  describe('#save') do
    it('adds a new client') do
      new_client = Client.new({:firstname => 'Deanna', :lastname => 'Monaco', :id => nil})
      new_client.save()
      expect(new_client.lastname()).to(eq('Monaco'))
    end
  end







end #spec end
