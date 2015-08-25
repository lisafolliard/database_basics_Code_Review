require('spec_helper')

describe(Client) do

  describe('#save') do
    it('adds a new client') do
      new_client = Client.new({:name => 'Deanna Monaco', :stylist_id => 1, :id => nil})
      new_client.save()
      expect(new_client.name()).to(eq('Deanna Monaco'))
    end
  end

  describe('.all') do
    it('returns all the clients in database') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('returns true if two IDs are equal') do
      new_client = Client.new({:name => 'Deanna Monaco', :stylist_id => 1, :id => nil})
      new_client2 = Client.new({:name => 'Shudi Wong', :stylist_id => 1, :id => nil})
      expect(new_client).to(eq(new_client2))
    end
  end
  #
  describe('.find') do
    it('finds an client based on ID') do
      new_client = Client.new({:name => 'Deanna Monaco', :stylist_id => 1, :id => nil})
      new_client.save()
      new_client2 = Client.new({:name => 'Jess Acuna', :stylist_id => 1, :id => nil})
      new_client2.save()
      expect(Client.find(new_client.id())).to(eq(new_client))
    end
  end

  describe('#update') do
    it('updates values of a client') do
      new_client = Client.new({:name => 'Den Monaco', :stylist_id => 1, :id => nil})
      new_client.save()
      new_client2 = Client.new({:name => 'Jess Acuna', :stylist_id => 1, :id => nil})
      new_client2.save()
      new_client.update({:name => 'Deanna Monaco'})
      expect(new_client.name()).to(eq('Deanna Monaco'))
    end
  end









end #spec end
