class Contributor < ActiveRecord::Base
  has_and_belongs_to_many :entries
  
  validates :name,
    :presence => { :message => 'The contributor\'s name must be provided' } 
end
