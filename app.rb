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

post('/stylists/') do
  name = params.fetch('name')
  new_stylist = Stylist.new({:name => name, :id => nil})
  new_stylist.save()
  @stylists = Stylist.all()
  redirect('/')
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist)
end

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

patch('/stylists/:id') do
  name = params.fetch('name')
  id = params.fetch("id").to_i()
  this_stylist = Stylist.find(id)
  this_stylist.update({:name => name})
  @stylist = this_stylist
  erb(:stylist)
end
#
# delete('/stylists/:id') do
#   @stylist = Stylist.find(params.fetch("id").to_i())
#   @stylist.delete()
#   @stylists = Stylist.all()
#   erb(:index)
# end
#
# get('/clients/new') do
#   # stylist_id = params.fetch('id').to_i()
#   # @stylist = Stylist.find(params.fetch("id").to_i())
#   erb(:client_form)
# end
#
# # post('/clients/new') do
# #   client = params.fetch('client')
# #   new_client = Client.new({:firstname => firstname, :lastname => lastname, :stylist_id => stylist_id, :id => nil})
# #   new_client.save()
# #   redirect('/')
# # end
#
# post('/stylists/:id') do
#   firstname = params.fetch('firstname')
#   lastname = params.fetch('lastname')
#   stylist_id = params.fetch('stylist_id').to_i()
#   @stylist = Stylist.find(stylist_id)
#   @client = Client.new({:firstname => firstname, :lastname => lastname, :stylist_id => stylist_id, :id => nil})
#   @client.save()
#   # new_client = Stylist.new({:firstname => firstname, :lastname => lastname, :id => nil})
#   # new_client.save()
#   # @stylists = Stylist.all()
#   erb(:stylist)
# end
#
# # post('/clients') do
# #   client = params.fetch('client')
# #   # stylist_id = params.fetch('stylist_id').to_i()
# #   # @list = List.find(list_id)
# #   @client = Client.new({:firstname => 'Deanna', :lastname => 'Monaco', :stylist_id => 1, :id => nil})
# #   @client.save()
# #   erb(:success)
# # end
