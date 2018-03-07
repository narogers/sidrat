class Backend::EntriesController < ApplicationController
  layout 'backend'
  
  def new
    series = get_series params[:series_id]
    case series.category
      when 'Multimedia'
       @entry = VideoEntry.new
      when 'Print'
       @entry = PrintEntry.new
    end
    @entry.series = series
    @doctors = get_doctors(@entry.series.abbreviation)

    if ['vna', 'vma'].include? @entry.series.abbreviation
      @entry.publisher = Publisher.find_by_name('Virgin')
    elsif ['eda', 'pda', 'nsb', 'newseries', 'classic'].include? @entry.series.abbreviation
      @entry.publisher = Publisher.find_by_name('BBC')
    else
      @entry.publisher = nil
    end
    @title = 'Add new item - ' << @entry.series.name
  end

  def create
    series = get_series params[:series_id]
    case series.category
      when 'Multimedia'
       @entry = VideoEntry.new(params[:video_entry])
      when 'Print'
       @entry = PrintEntry.new(params[:print_entry])
    end
    @entry.companions = set_companions params[:companions]
    # Since get_doctors is already defined elsewhere we need to use a
    # localized method to retrieve the records
    @entry.doctors = set_doctors params[:doctors]
    @entry.contributors = set_contributors params[:contributors]

    @entry.publisher = set_publisher params[:publisher]
    @entry.series = series
    
    if @entry.save
      flash[:notice] = 'Entry has been added to the database. See below for a preview of how it will appear to the public.'  
      redirect_to backend_series_entry_path(:series_id => series.abbreviation, :id => @entry)
    else
      # For the form
      @doctors = get_doctors(@series.abbreviation)

      flash[:notice] = 'Something has gone wrong. Fix the errors and try again. If problems persist contact an administrator'
      render :new
    end
  end
  
  def edit
    @entry = Entry.find(params[:id])
    @doctors = get_doctors(@entry.series.abbreviation)
    
    @title = 'Edit item - ' << @entry.series.name
  end
  
  def update
    series = get_series params[:series_id]
    case series.category
      when 'Multimedia'
       logger.debug '<< Video entry >>'
       @entry = VideoEntry.find(params[:id])
       @entry.broadcast_status = params[:video_entry][:broadcast_status]
       logger.debug "<< #{@entry.broadcast_status} >>"
       case @entry.broadcast_status
         when 'unaired'
           @entry.broadcast_starting = nil
           @entry.broadcast_ending = nil
         when 'broadcast'
           @entry.broadcast_starting = params[:video_entry][:broadcast_starting]
           @entry.broadcast_ending = params[:video_entry][:broadcast_ending] 
       end
       param_name = 'video_entry'
      when 'Print'
       logger.debug '<< Print entry >>'
       @entry = PrintEntry.find(params[:id])
       param_name = 'print_entry'
    end
    
    @entry.companions = set_companions params[:companions]
    @entry.doctors = set_doctors params[:doctors]
    @entry.contributors = set_contributors params[:contributors]
    if ['otherbooks', 'spinoffs'].include?(@entry.series.abbreviation)
      @entry.publisher = set_publisher params[:publisher]
    end
    
    return_value = @entry.update_attributes params[param_name]
    logger.debug("Parameter name << #{param_name} >>")
    logger.debug(params[param_name])
    logger.debug("Return value << #{return_value} >>")
    
    if return_value
      flash[:notice] = 'Entry has been updated. Below is a preview of how it will appear to the public.'  
      redirect_to backend_series_entry_path(:series_id => series.abbreviation,
        :id => @entry)
    else
      @doctors = get_doctors(@series.abbreviation)
      render :edit
    end
  end
  
  def show
    @entry = Entry.find(params[:id])
  end
  
  protected
  def get_doctors(series)
    logger.debug "Series identifier is #{series}" 
    
    case series
      when 'vna'
        @doctors = Doctor.where(:id => [7, 8])
      when 'vma'
        @doctors = Doctor.where(:id => 1..6)
      when 'eda'
        @doctors = Doctor.find(8)
      when 'pda'
        @doctors = Doctor.where(:id => 1..7)
      when 'nsb'
        @doctors = Doctor.where(:id => 9..11)
      when 'classic'
        @doctors = Doctor.where(:id => 1..8)
      when 'newseries'
        @doctors = Doctor.where(:id => 9..11)
      else
        @doctors = Doctor.find(:all)  
    end
  end
  
  def set_companions(companions)
    return [] if companions.nil?
    
    companions.delete_if { |c| c.empty? }
    companion_list = Companion.where(:name => companions)
  end
  
  def set_contributors(contributors)
    return [] if contributors.nil?
    
    contributor_list = []
    logger.debug(contributors);
    contributors.delete_if { |c| c.empty? }
    
    contributors.each do |con|
      unless Contributor.exists?(:name => con)
        contributor_list.push Contributor.new(:name => con)      
      else
        contributor_list.push Contributor.find_by_name(con)
      end
    end
    return contributor_list
  end

  def set_doctors(doctors)
    return [] if doctors.nil?
    
    doctors.delete_if { |d| d.empty? }
    doctor_list = Doctor.where(:id => doctors)
  end
  
  def set_publisher(publisher)
    unless Publisher.exists?(:name => publisher)
      Publisher.new(:name => publisher)
    else
      Publisher.find_by_name(publisher)
    end
  end
  
  def get_series(series_id)
    if series_id =~ /^\d+$/
      @series = Series.find(series_id)
    else
      @series = Series.find_by_abbreviation(series_id)
    end
  end
end
