class FeedsController < ApplicationController

  skip_before_filter :authenticate_user
  before_filter :authenticate_user_with_code_or_session 

  def show
    @person = @logged_in
    @items = @person.recently_tab_items
    respond_to do |format|
      format.html # show.html.erb
      format.js  { render :partial => 'feed' }
      format.xml { render :layout => false }
    end
  end


 def index
    @feeds = Feed.find(:all)

    
  end

 def new
    @feed = Feed.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @feed }
    end
  end


def create
   @feed = Feed.new(params[:feed])

    
      if @feed.save
        flash[:notice] = 'Feed was successfully created.'
        redirect_to(feeds_url)
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feed.errors, :status => :unprocessable_entity }
    
    end
end

# DELETE /feeds/1
  # DELETE /feeds/1.xml
  def destroy
    @feed = Feed.find(params[:id])
    
    @feed.destroy
  
    respond_to do |format|
      format.html { redirect_to(feeds_url) }
      format.xml  { head :ok }
    end
  end

end
