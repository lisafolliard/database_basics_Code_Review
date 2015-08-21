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




end #class method end
