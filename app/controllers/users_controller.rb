class UsersController < ApplicationController

  def new
  end


  def create
    @response = Http.post("http://tiy-secrets.herokuapp.com//users.json", json: {user:{email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confiration], name: params[:user][:name]}})


    user = JSON.parse(@response)
    session[:name] = user["name"]
    session[:token] = user["token"]

    @name = session[:name]
  end

end
