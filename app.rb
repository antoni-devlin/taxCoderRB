require_relative 'script'

require 'sinatra'
require "sinatra/reloader" if development?

before do
  @pageTitle = "TaxSolver"
end

get '/' do
  erb :index, :layout => :_base do
    erb :taxcode_form
  end
end

post '/tax-code-form/' do
  #Get the userprovided tax code form the form
  @code = params[:taxcode] || "No code given"
  
  #Check the taxcode using the getUsersTaxCode method
  usersTaxCode = getUsersTaxCode(@code)

  #Get all the outcomes that apply to the users tax code
  @outcomes = checkCode(usersTaxCode)
  
  #Get all the emergency outcomes that apply to the users tax code
  @emergencyOutcomes = checkEmergencyCode(usersTaxCode)

  #Get the personal allowance based on the users tax code
  @personalAllowance = getPersonalAllowance(usersTaxCode)

  #Render template
  erb :index, :layout => :_base do
     erb :outcome
   end
end