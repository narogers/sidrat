class SearchesController < ApplicationController
  respond_to :js, :json, :html
  
  def companion
    logger.debug "Searching list of companions"
    if params[:term]
      results = Companion.all(:conditions => ['name LIKE ?', params[:term] + '%'], :limit => 5, :order => 'name ASC')
    else
      results = Companion.all(:limit => 5, :order => 'name ASC')
    end

    @values = []
    results.each_with_index do |r, i|
      logger.debug "Result #{i} => #{r.name}"
      @values.push r.name
    end

    respond_with @values, :template => 'searches/autocomplete', :layout => false  
  end
  
  def contributor
    logger.debug "Searching list of contributors"
    
    if params[:term]
      results = Contributor.all(:conditions => ['name LIKE ?', params[:term] + '%'], :limit => 5, :order => 'name ASC', :limit => 5)
    else
      results = Contributor.all(:limit => 5, :order => 'name ASC')
    end
    @values = []
    results.each_with_index do |r, i|
      logger.debug "Result #{i} => #{r.name}"
      @values.push r.name
    end

    respond_with @values, :template => 'searches/autocomplete', :layout => false  
  end

  def publisher
    logger.debug "Searching list of publishers"
    if params[:term]
      results = Publisher.all(:conditions => ['name LIKE ?', params[:term] + '%'], :limit => 5, :order => 'name ASC', :limit => 5)
    else
      results = Publisher.all(:limit => 5, :order => 'name ASC')
    end

    @values = []
    results.each_with_index do |r, i|
      logger.debug "Result #{i} => #{r.name}"
      @values.push r.name
    end

    respond_with @values, :template => 'searches/autocomplete', :layout => false  
  end
end
