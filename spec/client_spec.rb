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

  describe('.all') do
    it('returns all the clients in database') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('returns true if two IDs are equal') do
      new_client = Client.new({:firstname => 'Deanna', :lastname => 'Monaco', :id => nil})
      new_client2 = Client.new({:firstname => 'Jessica', :lastname => 'Acuna', :id => nil})
      expect(new_client).to(eq(new_client2))
    end
  end

  describe('.find') do
    it('finds an client based on ID') do
      new_client = Client.new({:firstname => 'Deanna', :lastname => 'Monaco', :id => nil})
      new_client.save()
      new_client2 = Client.new({:firstname => 'Jessica', :lastname => 'Acuna', :id => nil})
      new_client2.save()
      expect(Client.find(new_client.id())).to(eq(new_client))
    end
  end









end #spec end
