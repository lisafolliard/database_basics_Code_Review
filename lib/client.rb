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




end #class method end
