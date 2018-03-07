class Companion < ActiveRecord::Base
  has_and_belongs_to_many :doctors, :readonly => true
  has_and_belongs_to_many :entries
  
  attr_accessor :uploaded_image
  
  validates :name, 
    :uniqueness => { 
      :message => 'That person already appears to be in the database'
    }
  validates_with ImageValidator, :fields => [:uploaded_image]
  
  before_save do
    unless uploaded_image.nil?
      logger.debug 'Generating full size and icon resources'
      resource = Image.new(uploaded_image)
      resource.prefix = "companion-#{id}"
      
      resource.convert
      resource.copy("#{Rails.root}/app/assets/images/companions")
      self.icon = "companions/#{resource.icon}"
      self.image = "companions/#{resource.full}"
      
      resource.destroy
    end
  end

end
