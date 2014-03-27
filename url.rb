require 'sinatra'
require 'sinatra/base'


class Url < Sinatra::Base

  URL_LIST = []
  NEW_URL_LIST = []
  H_URL = "http://radiant-atoll-4289.herokuapp.com/"


  get "/" do

    erb :index, :locals => {:url => URL_LIST, :new_url => NEW_URL_LIST}
  end

  post "/" do
    URL_LIST << params[:url]
    NEW_URL_LIST <<   H_URL

    redirect '/'
  end
end