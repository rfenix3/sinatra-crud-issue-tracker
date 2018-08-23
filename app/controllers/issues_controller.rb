class IssuesController < ApplicationController

  # GET: /issues
  get "/issues" do
    #binding.pry 
    #check value of session if user_id is retained.
    if Helpers.is_logged_in?(session)
      @support = Helpers.current_user(session)
      @issues = Issue.all
      #binding.pry
      erb :"/issues/index.html"
    else
      redirect "/supports/login"
    end
  end

  # GET: /issues/new
  get "/issues/new" do
    if Helpers.is_logged_in?(session)
      erb :"/issues/new.html"
    else
      redirect "/supports/login"
    end
  end

  # POST: /issues
  post "/issues" do
    if Helpers.is_logged_in?(session)
      binding.pry
      if Issue.new(params).valid?  
        binding.pry
        @support = Helpers.current_user(session)
        @issue = @support.issues.build(params)
        if @issue.save
          redirect "/supports/#{@support.slug}"
        else
          redirect "/issues/new"
        end
      else
        redirect "/issues/new"
      end
    else
      redirect "/supports/login"
    end
  end

  # GET: /issues/5
  get "/issues/:id" do
    if Helpers.is_logged_in?(session)
      @support = Helpers.current_user(session)
      @issue = Issue.find_by(id: params[:id])
      #binding.pry
      erb :"/issues/show.html"
    else
      redirect "/supports/login"
    end
  end

  # GET: /issues/5/edit
  get "/issues/:id/edit" do
    if Helpers.is_logged_in?(session)
      @issue = Issue.find_by_id(params[:id])
      if @issue && @issue.support == Helpers.current_user(session)
        erb :"/issues/edit.html"
      else
        redirect '/issues'
      end
    else
      redirect '/supports'
    end
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
