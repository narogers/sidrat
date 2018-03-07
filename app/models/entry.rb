class Entry < ActiveRecord::Base
  attr_accessor :uploaded_image

  # Relationship with other models
  belongs_to :series
  belongs_to :publisher
  has_and_belongs_to_many :doctors, :readonly => true
  has_and_belongs_to_many :companions, :order => :name, :readonly => true
  has_and_belongs_to_many :contributors, :order => :name, :readonly => true
  
  # Enumerations for the format and status to control the values
  FORMATS = { :print => ['Hardback', 'Paperback'],
              :multimedia => ['Audio', 'CD', 'DVD', 'VHS'] }
  STATES = ['Owned', 'On Order', 'Upcoming', 'Missing', 'Unreleased', 'Wanted']
  
  validates :title, 
    :presence => { :message => 'This field is required' }
  validates :description, 
    :presence => { :message => 'This field is required' }
  validates :length, 
    :numericality => { 
      :message => 'Length must be entered in numeric form',
      :allow_blank => false
    }
    
  before_save do
    logger.debug "<< Checking to see if thumbnails should be generated >>"
    unless uploaded_image.nil?
      logger.debug 'Generating full size and icon resources'
      resource = Image.new(uploaded_image)
      resource.prefix = "#{series.abbreviation}"
      
      resource.convert
      resource.copy("#{Rails.root}/app/assets/images/covers")
      self.icon = "covers/#{resource.icon}"
      self.image = "covers/#{resource.full}"
      
      resource.destroy
    end
  end
end

