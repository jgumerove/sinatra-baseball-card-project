require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end
  

  helpers do

    def logged_in?
      !!session[:user_id]
    end
    
    def current_user
      logged_in? && User.find(session[:user_id]) #if true will return second thing if false return first thing 
    end

    def redirect_if_not_logged_in
      redirect "/login" if !current_user
    end

    def separate_comma(number)
      a = number.to_s.split('')
      b = a.size/3.0
      if a.size < 4
         number.to_s 
      elsif a.size%3 == 0
        n = -4
        (b.to_i-1).times do |i|
          a.insert(n, ',')
          n -= 4
        end
         a.join("")
      else
          n = -4
        b.to_i.times do |i|
          a.insert(n, ',')
          n -= 4
        end
        a.join("")
      end
    end

  end

end
