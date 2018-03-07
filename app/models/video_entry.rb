class VideoEntry < Entry
  validates :season, 
    :numericality => {
      :message => 'Season must be numeric if provided'
    }
  validates :episode, 
    :numericality => {
      :only_integer => true,
      :message => 'Episode must be in a numeric format',
      :allow_blank => true
    }
  validates_with BroadcastValidator
end    