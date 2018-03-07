class Backend::CompanionsController < ApplicationController
  layout 'backend'
  
  def index
    @doctors = Doctor.find(:all)
    @title = 'Manage companions'
  end
  
  def new
    @companion = Companion.new
    @doctors = Doctor.find(:all)
    @title = 'Add new companion'
  end
  
  def create
    @companion = Companion.new(params[:companion])    
    @title = 'Add new companion'
    
    if @companion.save
      flash[:notice] = 'A new companion has been added to the database.'
      render :show 
    else
      @doctors = Doctor.find(:all)
      render :new 
    end
  end
  
  def edit
    @companion = Companion.find(params[:id])
    @doctors = Doctor.find(:all)
    @title = 'Edit companions - ' << @companion.name
  end
  
  def update
    @companion = Companion.find(params[:id])
    @companion.attributes = params[:companion]
    @title = 'Update companions - ' << @companion.name
    
    if @companion.save
      flash[:notice] = 'The record has been updated. Users will now see it as it appears below.'
      render :show
    else
      @doctors = Doctor.find(:all)
      render :edit
    end
  end
  
  def show
    flash[:notice] = 'Below is the record as it appears to the public. See any problems? Corrections are a mouse click away.'
    @companion = Companion.find(params[:id])
  end
end
