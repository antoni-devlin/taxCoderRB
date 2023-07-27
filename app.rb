# app.rb

require 'sinatra'
require "sinatra/reloader" if development?
set :static, true
set :public_folder, "static"
set :views, "views"

before do
  @pageTitle = "TaxSolver"
end

get '/' do
  erb :index, :layout => :_base do
    erb :taxcode_form
  end
end

post '/tax-code-form/' do
  #Render template
  erb :index, :layout => :_base do
     erb :outcome
   end
end