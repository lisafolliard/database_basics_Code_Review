require('spec_helper')

describe(Client) do

  describe('#save') do
    it('adds a new client') do
      new_client = Client.new({:firstname => 'Deanna', :lastname => 'Monaco', :stylist_id => 1, :id => nil})
      new_client.save()
      expect(new_client.lastname()).to(eq('Monaco'))
    end
  end

  describe('.all') do
    it('returns all the clients in database') do
      expect(Client.all()).to(eq([]))
    end
  end

  # describe('#==') do
  #   it('returns true if two IDs are equal') do
  #     new_client = Client.new({:firstname => 'Deanna', :lastname => 'Monaco', :stylist_id => 1, :id => nil})
  #     new_client2 = Client.new({:firstname => 'Jessica', :lastname => 'Acuna', :stylist_id => 1, :id => nil})
  #     expect(new_client).to(eq(new_client2))
  #   end
  # end
  # #
  describe('.find') do
    it('finds an client based on ID') do
      new_client = Client.new({:firstname => 'Deanna', :lastname => 'Monaco', :stylist_id => 1, :id => nil})
      new_client.save()
      new_client2 = Client.new({:firstname => 'Jessica', :lastname => 'Acuna', :stylist_id => 1, :id => nil})
      new_client2.save()
      expect(Client.find(new_client.id())).to(eq(new_client))
    end
  end

  # describe('#update') do
  #   it('updates values of a client') do
  #     new_client = Client.new({:firstname => 'Deanna', :lastname => 'Mono', :stylist_id => 1})
  #     new_client.save()
  #     new_client2 = Client.new({:firstname => 'Jessica', :lastname => 'Acuna', :stylist_id => 1})
  #     new_client2.save()
  #     new_client.update({:lastname => 'Monaco'})
  #     expect(new_client.lastname()).to(eq('Monaco'))
  #   end
  # end
  #
  # describe('#delete') do
  #   it('deletes a client entry') do
  #     new_client = Client.new({:firstname => 'Deanna', :lastname => 'Mono', :id => nil})
  #     new_client.save()
  #     new_client2 = Client.new({:firstname => 'Jessica', :lastname => 'Acuna', :id => nil})
  #     new_client2.save()
  #     new_client.delete()
  #     expect(Client.all()).to(eq([new_client2]))
  #   end
  # end




end #spec end
