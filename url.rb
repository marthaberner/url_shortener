require 'sinatra'
require 'sinatra/base'


class Url < Sinatra::Base

  get "/" do

    erb :index

  end
end