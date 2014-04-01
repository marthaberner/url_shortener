require 'sinatra'
require 'sinatra/base'


class Url < Sinatra::Base

  URL_LIST = []
  NEW_URL_LIST = []
  H_URL = "http://my-little-url.herokuapp.com/"

  get "/" do
    id = NEW_URL_LIST.length.to_i
    erb :index, :locals => {:id => id + 1}
  end

  post "/:id" do
    id = params[:id].to_i
    URL_LIST << params[:url]
    NEW_URL_LIST << H_URL
    redirect "/#{id}"
  end

  get '/:id' do
    id = params[:id].to_i
    new_url = NEW_URL_LIST[id - 1]
    old_url = URL_LIST[id - 1]
    erb :show, :locals => {:old_url => old_url, :new_url => new_url, :id => id}
  end
end