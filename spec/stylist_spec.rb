require('spec_helper')

describe(Stylist) do

  describe('#save') do
    it('adds a new stylist') do
      new_stylist = Stylist.new({:name => 'Dawn', :id => nil})
      new_stylist.save()
      expect(new_stylist.name()).to(eq('Dawn'))
    end
  end

end #spec end
