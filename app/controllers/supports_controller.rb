class SupportsController < ApplicationController

  # GET: /supports
  get "/supports" do
    erb :"/supports/index.html"
  end

  # GET: /supports/new
  get "/supports/new" do
    if Helpers.is_logged_in?(session)
        redirect '/issues'
    else
        erb :"/supports/new.html"
    end
  end

 # LOGIN: /supports/login
  get "/supports/login" do
    erb :"/supports/login.html"
  end

  get "/supports/logout" do
    if Helpers.is_logged_in?(session)
      session.destroy
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
      session[:user_id] = @support.id
      redirect "/issues"
    else
      redirect "/supports/new"
    end
  end

  post "/supports/login" do
    support = Support.find_by(username: params[:username])
    if support && support.authenticate(params[:password])
      session[:user_id] = support.id
      redirect "/issues"
    else
      redirect "/supports/login"
    end
  end

  get "/supports/:slug" do
    if Helpers.is_logged_in?(session)
      @support = Support.find_by_slug(params[:slug])
      @issues = @support.issues
      erb :"/supports/owned_issues.html"
    else
      redirect "/"
    end

  end

  # Future enhancement. Only admins should be able to see all support resources' record.
   # GET: /supports/5
  # get "/supports/:id" do
  #   erb :"/supports/show.html"
  # end

  # Future enhancement. Only admins should be able to update support resources' record.
  # GET: /supports/5/edit
  # get "/supports/:id/edit" do
  #   erb :"/supports/edit.html"
  # end

  # Future enhancement. Only admins should be able to update support resources' record.
  # PATCH: /supports/5
  # patch "/supports/:id" do
  #   redirect "/supports/:id"
  # end

  # Future enhancement. Only admins should be able to delete support resources' record.
  # DELETE: /supports/5/delete
  # delete "/supports/:id/delete" do
  #   redirect "/supports"
  # end

  
  # get '/users/:slug' do
  #   @support = Support.find_by_slug(params[:slug])
  #   erb :'supports/show'
  # end


end
