require 'sinatra'
require 'sinatra/base'


class Url < Sinatra::Base

  URL_LIST = []
  NEW_URL_LIST = []

  get "/" do
    id = NEW_URL_LIST.length.to_i
    erb :index, :locals => {:id => id + 1}
  end

  post "/:id" do
    id = params[:id].to_i
    if params[:url].include?("http://")
      URL_LIST << params[:url]
    else
      URL_LIST << "http://" + params[:url]
    end
    NEW_URL_LIST << request.base_url.to_s + "/"
    redirect "/#{id}?stats=true"
  end

  get '/:id' do
    id = params[:id].to_i
    new_url = NEW_URL_LIST[id - 1]
    old_url = URL_LIST[id - 1]
    if params[:stats]
      erb :show, :locals => {:old_url => old_url, :new_url => new_url, :id => id}
    else
      redirect old_url.to_s
    end
  end
end