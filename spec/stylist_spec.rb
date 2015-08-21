require('spec_helper')

describe(Stylist) do

  describe('#save') do
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

  describe('.find') do
    it('returns stylist by ID number') do
      new_stylist = Stylist.new({:firstname => 'Dawn', :lastname => 'LaCovey', :id => nil})
      new_stylist.save()
      new_stylist2 = Stylist.new({:firstname => 'Lisa', :lastname => 'Weaver', :id => nil})
      new_stylist2.save()
      expect(Stylist.find(new_stylist2.id())).to(eq(new_stylist2))
    end
  end

  describe('#update') do
    it('updates values of a stylist') do
      new_stylist = Stylist.new({:firstname => 'Deen', :lastname => 'LaCovey', :id => nil})
      new_stylist.save()
      new_stylist.update({:firstname => 'Dawn'})
      expect(new_stylist.firstname()).to(eq('Dawn'))
    end
  end

  describe('#delete') do
    it('deletes a stylist') do
      new_stylist = Stylist.new({:firstname => 'Dawn', :lastname => 'LaCovey', :id => nil})
      new_stylist.save()
      new_stylist2 = Stylist.new({:firstname => 'Lisa', :lastname => 'Weaver', :id => nil})
      new_stylist2.save()
      new_stylist.delete()
      expect(Stylist.all()).to(eq([new_stylist2]))
    end
  end



end #spec end
