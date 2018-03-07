class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.find(:all)
    @doctor_rows = @doctors.in_groups_of(4, false)
    @title = 'Browse by Doctor'
  end
end
