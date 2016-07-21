require 'sinatra/base'
require_relative './lib/bank'



class Fruity < Sinatra::Base
  enable :sessions

  get '/' do
    erb :credit_form
  end

  get '/play' do
    @funds = $fruity.show_balance
    $fruity.insert_coin
    erb :play
  end

  post '/credit' do
    $fruity = FruitMachine.new(Bank.new(params[:credit].to_i))
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
