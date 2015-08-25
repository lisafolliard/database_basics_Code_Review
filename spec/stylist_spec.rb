require('spec_helper')

describe(Stylist) do

  describe('#save') do
    it('adds a new stylist') do
      new_stylist = Stylist.new({:name => 'Dawn', :id => nil})
      new_stylist.save()
      expect(new_stylist.name()).to(eq('Dawn'))
    end
  end

  describe('.all') do
    it('should be empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('returns true if two IDs are equal') do
      new_stylist = Stylist.new({:name => 'Dawn', :id => nil})
      new_stylist.save()
      expect(Stylist.all()).to(eq([new_stylist]))
    end
  end

  describe('.find') do
    it('returns stylist by ID number') do
      new_stylist = Stylist.new({:name => 'Dawn', :id => nil})
      new_stylist.save()
      new_stylist2 = Stylist.new({:name => 'Melanie', :id => nil})
      new_stylist2.save()
      expect(Stylist.find(new_stylist2.id())).to(eq(new_stylist2))
    end
  end

  describe('#update') do
    it('updates values of a stylist') do
      new_stylist = Stylist.new({:name => 'Deen', :id => nil})
      new_stylist.save()
      new_stylist.update({:name => 'Dawn'})
      expect(new_stylist.name()).to(eq('Dawn'))
    end
  end

  describe('#delete') do
    it('deletes a stylist') do
      new_stylist = Stylist.new({:name => 'Dawn', :id => nil})
      new_stylist.save()
      new_stylist2 = Stylist.new({:name => 'Shari', :id => nil})
      new_stylist2.save()
      new_stylist.delete()
      expect(Stylist.all()).to(eq([new_stylist2]))
    end
  end


end #spec end
