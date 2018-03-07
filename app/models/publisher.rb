class Publisher < ActiveRecord::Base
  has_many :entries
  
  validates :name, 
    :presence => { :message => 'The name is required' }
  validates :name, 
    :uniqueness => { :message => 'That name is already taken.' }
end
