class Client
  attr_reader(:name, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result_set = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result_set.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    clients = []
    result_set = DB.exec("SELECT * FROM clients;")
    result_set.each() do |client|
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id').to_i()
      id = client.fetch('id').to_i()
      new_client = Client.new({:name => name, :stylist_id => stylist_id, :id => id})
      clients.push(new_client)
    end
    clients
  end

  define_method(:==) do |another_client|
    self.id().==(another_client.id())
  end

  define_singleton_method(:find) do |id|
    Client.all().each() do |client|
      if client.id() == id
        return client
      end
    end
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
    @id = self.id()
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
    DB.exec("UPDATE clients SET stylist_id = '#{@stylist_id}' WHERE id = #{@id};")
  end
#
#   define_method(:delete) do
#     DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
#   end
#
#
end #class method end
