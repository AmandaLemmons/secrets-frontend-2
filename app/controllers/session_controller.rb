class SessionController < ApplicationController
require 'http'

  def new
  end

  def create

    @http_response = Http.post("http://tiy-secrets.herokuapp.com/auth.json", json: {email: params[:email], password: params[:password]})

    user = JSON.parse(@http_response)
    session[:name] = user["name"]
    session[:token] = user["token"]
    @name = session[:name]

  end

  def destroy
    session[:name] = nil
    redirect_to root_path
  end


end
