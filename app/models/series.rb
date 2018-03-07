class Series < ActiveRecord::Base
  has_many :entries, :order => [:season, :episode, :released_on]
  attr_accessor :uploaded_image
  
  validates :name, 
    :uniqueness => { :message => 'That name is already taken' }
  validates :series_started_on, 
    :numericality => {
      :greater_than_or_equal_to => 1963,
      :only_integer => true,
      :message => 'That is not a valid starting year'
    }
  validates :series_ended_on, 
    :numericality => {
      :greater_than => :series_started_on,
      :only_integer => true,
      :message => 'The end date is too soon. Check to see if the years are reversed'
    }
  validates_with ImageValidator, :fields => [:uploaded_image]
  
  before_save do
    unless uploaded_image.nil?
      logger.debug 'Generating full size and icon resources'
      resource = Image.new(uploaded_image)
      resource.prefix = "series-#{id}"
      
      resource.convert
      resource.copy("#{asset_path}/images/series")
      self.image = "series/#{resource.icon}"

      resource.destroy
    end
  end

end
