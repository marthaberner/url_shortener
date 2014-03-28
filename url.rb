require 'sinatra'
require 'sinatra/base'


class Url < Sinatra::Base

  URL_LIST = []
  NEW_URL_LIST = []
  H_URL = "http://radiant-atoll-4289.herokuapp.com/"


  get "/" do
    id = NEW_URL_LIST.length.to_i

    erb :index, :locals => {:id => id}
  end

  get "/show" do
    id = params[:id].to_i
    new_url = NEW_URL_LIST[id]
    old_url = URL_LIST[id]

    erb :show, :locals => {:old_url => old_url, :new_url => new_url, :id => id}

  end


  post "/show/:id" do
    id = params[:id].to_i
    URL_LIST << params[:url]
    NEW_URL_LIST << H_URL



    redirect "/show/#{id}"

  end

  get '/show/:id' do
    id = params[:id].to_i
    new_url = NEW_URL_LIST[id]
    old_url = URL_LIST[id]

    erb :show, :locals => {:old_url => old_url, :new_url => new_url, :id => id}
  end

end