class IssuesController < ApplicationController

  # GET: /issues
  get "/issues" do
    binding.pry 
    #check value of session if user_id is retained.
    if Helpers.is_logged_in?(session)
      @support = Helpers.current_user(session)
      @issues = Issue.all
      binding.pry
      erb :"/issues/index.html"
    else
      redirect "/supports/login"
    end
  end

  # GET: /issues/new
  get "/issues/new" do
    erb :"/issues/new.html"
  end

  # POST: /issues
  post "/issues" do
    redirect "/issues"
  end

  # GET: /issues/5
  get "/issues/:id" do
    erb :"/issues/show.html"
  end

  # GET: /issues/5/edit
  get "/issues/:id/edit" do
    erb :"/issues/edit.html"
  end

  # PATCH: /issues/5
  patch "/issues/:id" do
    redirect "/issues/:id"
  end

  # DELETE: /issues/5/delete
  delete "/issues/:id/delete" do
    redirect "/issues"
  end
end
