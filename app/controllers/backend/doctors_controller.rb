class Backend::DoctorsController < ApplicationController
  layout 'backend'
  
  def index
    @doctors = Doctor.find(:all)
    @title = 'Manage Doctors'
  end
  
  def show
    @doctor = Doctor.find(params[:id])
    @title = 'Preview Doctor - ' << @doctor.label
  end
  
  def edit
    @doctor = Doctor.find(params[:id])
    @title = 'Edit - ' << @doctor.label
  end
  
  def update
    @doctor = Doctor.find(params[:id])
    @doctor.attributes = params[:doctor]
    @title = 'Preview Doctor - ' << @doctor.label

    if @doctor.save
      flash[:notice] = 'The database has been updated. Changes will appear immediately in the public interface.'
      redirect_to backend_doctor_path @doctor
    else
      render :edit
    end
  end

end
