class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result_set = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result_set.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    stylists = []
    result_set = DB.exec("SELECT * FROM stylists;")
    result_set.each() do |stylist|
      id = stylist.fetch('id').to_i()
      name = stylist.fetch("name")
      new_stylist = Stylist.new({:name => name, :id => id})
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

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
    DB.exec("DELETE FROM clients WHERE stylist_id = #{self.id()}")
  end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      id = client.fetch('id').to_i()
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id').to_i()
      stylist_clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    stylist_clients
  end
end #class method end
