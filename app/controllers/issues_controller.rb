class IssuesController < ApplicationController

  # GET: /issues
  get "/issues" do
    if Helpers.is_logged_in?(session)
      @support = Helpers.current_user(session)
      @issues = Issue.all
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
      if Issue.new(params).valid?  
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
    if Helpers.is_logged_in?(session)
      if params[:status] == "" || params[:title] == ""
        redirect "/issues/#{params[:id]}/edit"
      else
        @issue = Issue.find_by_id(params[:id])
        if @issue && @issue.support == Helpers.current_user(session) #only active sessions' issue
          if @issue.update(
            status: params[:status], 
            owner: params[:owner], 
            created: params[:created], 
            completion: params[:completion], 
            title: params[:title])
            redirect "/issues/#{@issue.id}"
          else
            redirect "/issues/#{@issue.id}/edit" #if there are update errors for any reasons
          end
        else
          redirect "/issues"  #will go here if active session just typed in the url and he is not issue owner.
        end
      end
    else
      redirect "/supports/login" #if there is no active session. 
    end

  end  # patch end

  # DELETE: /issues/5/delete
  delete "/issues/:id/delete" do
    redirect "/issues"
  end
end
