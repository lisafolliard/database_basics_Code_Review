class Stylist
  attr_reader(:firstname, :lastname, :id)

  define_method(:initialize) do |attributes|
    @firstname = attributes.fetch(:firstname)
    @lastname = attributes.fetch(:lastname)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result_set = DB.exec("INSERT INTO stylists (firstname, lastname) VALUES ('#{@firstname}', '#{@lastname}') RETURNING id;")
    @id = result_set.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    stylists = []
    result_set = DB.exec("SELECT * FROM stylists;")
    result_set.each() do |row|
      firstname = row.fetch("firstname")
      lastname = row.fetch("lastname")
      id = row.fetch('id').to_i()
      new_stylist = Stylist.new({:firstname => firstname, :lastname => lastname, :id => id})
      stylists.push(new_stylist)
    end
    stylists
  end

  define_method(:==) do |another_stylist|
    self.id().==(another_stylist.id())
  end

  define_singleton_method(:find) do |id|
  Stylist.all().each() do |stylist|
    if stylist.id() == id
      return stylist
    end
  end
end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      firstname = client.fetch('firstname')
      lastname = client.fetch('lastname')
      stylist_id = client.fetch('stylist_id').to_i()
      stylist_clients.push(Client.new({:firstname => firstname, :lastname => lastname, :stylist_id => stylist_id, :id => nil}))
    end
    stylist_clients
  end

  define_method(:update) do |fields_to_update|
    @firstname = fields_to_update.fetch(:firstname, @firstname)
    @lastname = fields_to_update.fetch(:lastname, @lastname)
    @id = self.id()
    DB.exec("UPDATE stylists SET firstname = '#{@firstname}', lastname = '#{@lastname}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end

end #class method end
