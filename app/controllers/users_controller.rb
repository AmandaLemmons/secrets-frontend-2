class UsersController < ApplicationController

  def new
  end


  def create
    @response = Http.post("http://localhost:3000/users.json", json: {user:{email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confiration], name: params[:user][:name]}})


    user = JSON.parse(@response)
    session[:name] = user["name"]
    session[:token] = user["token"]

    @name = session[:name]
  end

end
