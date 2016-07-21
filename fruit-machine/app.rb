require 'sinatra/base'

class Fruity < Sinatra::Base
  get '/' do
    erb :bet_form
  end

  post '/place-bet' do
    @bet = params[:bet_amount]
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
