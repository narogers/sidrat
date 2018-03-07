class EntriesController < ApplicationController
  def index
  end
  
  def browse
    stub = 'Listing of entries undeneath collection #{params[:collection]}'
    render :text => stub
  end
  
  def details 
    stub = 'Details for #{params[:id]} under collection #{params[:collection]}'
    render :text => stub
  end
end
