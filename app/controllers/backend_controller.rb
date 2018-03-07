class BackendController < ApplicationController
  layout 'backend'
  
  def index
    redirect_to :controller => 'backend/series', :action => 'index'
  end
end
