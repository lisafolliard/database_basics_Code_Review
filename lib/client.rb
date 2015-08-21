class Client
  attr_reader(:firstname, :lastname, :id)

  define_method(:initialize) do |attributes|
    @firstname = attributes.fetch(:firstname)
    @lastname = attributes.fetch(:lastname)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result_set = DB.exec("INSERT INTO clients (firstname, lastname) VALUES ('#{@firstname}', '#{@lastname}') RETURNING stylist_id;")
    @id = result_set.first().fetch("stylist_id")
  end

  define_singleton_method(:all) do
    clients = []
    result_set = DB.exec("SELECT * FROM clients;")
    result_set.each() do |row|
      firstname = row.fetch('firstname')
      lastname = row.fetch('lastname')
      id = row.fetch('stylist_id')
      new_client = Client.new({:firstname => firstname, :lastname => lastname, :id => id})
      clients.push(new_client)
    end
    clients
  end

end #class method end
