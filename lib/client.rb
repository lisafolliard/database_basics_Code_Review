require('pry')

class Client
  attr_reader(:firstname, :lastname, :stylist_id)

  define_method(:initialize) do |attributes|
    @firstname = attributes.fetch(:firstname)
    @lastname = attributes.fetch(:lastname)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_method(:save) do
    result_set = DB.exec("INSERT INTO clients (firstname, lastname, stylist_id) VALUES ('#{@firstname}', '#{@lastname}', '#{@stylist_id}');")
    # @id = result_set.first().fetch("stylist_id")
  end

  define_singleton_method(:all) do
    clients = []
    result_set = DB.exec("SELECT * FROM clients;")
    result_set.each() do |row|
      firstname = row.fetch('firstname')
      lastname = row.fetch('lastname')
      stylist_id = row.fetch('stylist_id').to_i()
      new_client = Client.new({:firstname => firstname, :lastname => lastname, :stylist_id => stylist_id})
      clients.push(new_client)
    end
    clients
  end

  define_method(:==) do |another_client|
    self.stylist_id().==(another_client.stylist_id())
  end

  define_singleton_method(:find) do |id|
    Client.all().each() do |client|
      if client.stylist_id() == id
        return client
      end
    end
  end

  # define_method(:update) do |attributes|
  #   @firstname = attributes.fetch(:firstname, @firstname)
  #   @lastname = attributes.fetch(:lastname, @lastname)
  #   @stylist_id = attributes.fetch(:stylist_id)
  #   DB.exec("UPDATE clients SET firstname = '#{@firstname}', lastname = '#{@lastname}' WHERE stylist_id = #{@stylist_id};")
  # end

  # define_method(:delete) do
  #   DB.exec("DELETE FROM clients WHERE stylist_id = #{@id};")
  # end


end #class method end
