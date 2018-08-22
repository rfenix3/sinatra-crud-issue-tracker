class SupportsController < ApplicationController

  # GET: /supports
  get "/supports" do
    erb :"/supports/index.html"
  end

  # GET: /supports/new
  get "/supports/new" do
      erb :"/supports/new.html"
    # if !Helpers.is_logged_in?(session)
    #     erb :'/supports/create_account'
    # else
    #     redirect '/issues'
    # end
  end

 # LOGIN: /supports/login
  get "/supports/login" do
    erb :"/supports/login.html"
  end

  get "/supports/logout" do
    if Helpers.is_logged_in?(session)
      session.destroy
      binding.pry
      redirect "/supports/login"
    else
      redirect "/"
    end
  end


  # POST: /supports
  post "/supports" do
    if Support.new(params).valid?  
      @support = Support.new(params)
      @support.save
      #binding.pry
      session[:user_id] = @support.id
      #binding.pry
      redirect "/issues"
    else
      redirect "/supports/new"
    end
  end

  # GET: /supports/5
  get "/supports/:id" do
    erb :"/supports/show.html"
  end

  # GET: /supports/5/edit
  get "/supports/:id/edit" do
    erb :"/supports/edit.html"
  end

  # PATCH: /supports/5
  patch "/supports/:id" do
    redirect "/supports/:id"
  end

  # DELETE: /supports/5/delete
  delete "/supports/:id/delete" do
    redirect "/supports"
  end

 
  
  # get '/users/:slug' do
  #   @user = User.find_by_slug(params[:slug])
  #   erb :'users/show'
  # end


end
