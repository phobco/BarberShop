#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :phone, presence: true
  validates :datestamp, presence: true
  validates :color, presence: true
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
  validates :mail, presence: true
  validates :message, presence: true
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index 
end

get '/visit' do
  @c = Client.new
  erb :visit
end

get '/contacts' do
  @c = Contact.new
  erb :contacts
end

get '/barber/:id' do
  @barber = Barber.find(params[:id])
  erb :barber
end

get '/bookings' do
  @clients = Client.all
  erb :bookings
end

get '/client/:id' do
  @client = Client.find(params[:id])
  erb :client
end

post '/visit' do

  @c = Client.new params[:client]
  if @c.save
    erb "<h2>Спасибо, вы записались!</h2>"
  else
    @error = @c.errors.full_messages.first
    erb :visit
  end
  end

post '/contacts' do
   
   @c = Contact.new params[:contact]
   if @c.save
     erb "<h2>Готово!</h2>"
   else
     @error = @c.errors.full_messages.first
     erb :contacts
   end
end

