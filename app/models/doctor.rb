class Doctor < ActiveRecord::Base
  include ActiveModel::Validations
  
  has_and_belongs_to_many :companions, :readonly => true
  belongs_to :entries
  attr_accessor :uploaded_image

  validates :label, 
    :presence => { :message => "This field cannot be empty" }
  validates :played_by, 
    :presence => { :message => "This field cannot be empty" }
  validates :start_year, 
    :numericality => {
      :allow_nil => true,
      :only_integer => true,
      :greater_than => 1960,
      :less => 2100,
      :message => 'The starting year must be between 1960 and 2100'
    }
  validates :end_year, 
    :numericality => {
      :allow_nil => true,
      :only_integer => true,
      :greater_than => :start_year,
      :message => 'The end year must be after the starting year'
    }
  validates_with ImageValidator, :fields => [:uploaded_image]
    
  before_save do
    unless uploaded_image.nil?
      logger.debug 'Generating full size and icon resources'
      resource = Image.new(uploaded_image)
      resource.prefix = "doctor-#{id}"
      
      resource.convert
      resource.copy("#{Rails.root}/app/assets/images/doctors")
      self.icon = "doctors/#{resource.icon}"
      self.image = "doctors/#{resource.full}"
      
      resource.destroy
    end
  end
  
end
