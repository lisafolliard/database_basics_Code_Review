require('spec_helper')

describe(Client) do

  describe('#save') do
    it('adds a new client') do
      new_client = Client.new({:name => 'Deanna', :stylist_id => 1, :id => nil})
      new_client.save()
      expect(new_client.name()).to(eq('Deanna'))
    end
  end

  describe('.all') do
    it('returns all the clients in database') do
      expect(Client.all()).to(eq([]))
    end
  end










end #spec end
