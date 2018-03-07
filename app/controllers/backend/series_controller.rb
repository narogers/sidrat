class Backend::SeriesController < ApplicationController
  layout 'backend'
  
  def index
    @series_hash = {}
    Series.find(:all).each do |s|
      @series_hash[s.abbreviation] = s
    end
    
    @title = 'Manage all series'
  end
  
  def show
    if params[:id] =~ /^\d+$/
      @series = Series.find(params[:id])
    else
      @series = Series.find_by_abbreviation(params[:id])
    end
    @title = 'Manage series - ' << @series.name
  end
  
  def edit
    if params[:id] =~ /^\d+$/
      @series = Series.find(params[:id])
    else
      @series = Series.find_by_abbreviation(params[:id])
    end
    @title = 'Edit series - ' << @series.name
  end
  
  def update
    logger.debug('Updating information for series')
    
    if params[:id] =~ /^\d+$/
      @series = Series.find(params[:id])
    else
      @series = Series.find_by_abbreviation(params[:id])
    end
    # Why do it this way? It ensure that the title and abbreviation can never
    # be overwritten by sending them as parameters
    @series.description = params[:series][:description]
    @series.series_started_on = params[:series][:series_started_on]
    @series.series_ended_on = params[:series][:series_ended_on]    
    
    if @series.save
      redirect_to backend_series_path(:id => @series.abbreviation), 
        :notice => 'The description has been updated'
    else
      render :edit
    end
  end
end
