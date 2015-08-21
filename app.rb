require './lib/client.rb'
require './lib/stylist.rb'
require 'sinatra/reloader'
require 'sinatra'
also_reload '../lib/**/*.rb'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/stylists') do
  firstname = params.fetch('firstname')
  lastname = params.fetch('lastname')
  new_stylist = Stylist.new({:firstname => firstname, :lastname => lastname, :id => nil})
  new_stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

patch('/stylists/:id') do
  firstname = params.fetch('firstname')
  lastname = params.fetch('lastname')
  id = params.fetch("id").to_i()
  thisstylist = Stylist.find(id)
  thisstylist.update({:firstname => firstname, :lastname => lastname})
  @stylist = thisstylist
  erb(:stylist)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end

get('/clients/new') do
  stylist_id = params.fetch("id").to_i()
  @stylist = Stylist.find(stylist_id)
  erb(:client_form)
end

post('/clients') do
  client = params.fetch('client')
  stylist_id = params.fetch('stylist_id').to_i()
  # @list = List.find(list_id)
  @client = Client.new({:firstname => 'Deanna', :lastname => 'Monaco', :stylist_id => 1, :id => nil})
  @client.save()
  erb(:success)
end
