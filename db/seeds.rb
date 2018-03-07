# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Now work on the Series entries one by one since they are bit more complex
# then key/value pairs
series = Series.find_or_create_by_abbreviation(:abbreviation => 'classic', :name => 'Classic series', :category => 'Multimedia')
series.image = 'classicseries'
series.save!

series = Series.find_or_create_by_abbreviation(:abbreviation => 'newseries', :name => 'New series', :category => 'Multimedia')
series.image = 'newseries'
series.save!

series = Series.find_or_create_by_abbreviation(:abbreviation => 'spinoffs', :name => 'Spinoffs', :category => 'Multimedia')
series.image = 'spinoffs'
series.save!

series = Series.find_or_create_by_abbreviation(:abbreviation => 'vna', :name => 'Virgin New Adventures', :category => 'Print')
series.image = 'vna'
series.save!

series = Series.find_or_create_by_abbreviation(:abbreviation => 'vma', :name => 'Virgin Missing Adventures', :category => 'Print')
series.image = 'vma'
series.save!

series = Series.find_or_create_by_abbreviation(:abbreviation => 'eda', :name => 'Eighth Doctor Adventures', :category => 'Print')
series.image = 'eda'
series.save!

series = Series.find_or_create_by_abbreviation(:abbreviation => 'pda', :name => 'Past Doctor Adventures', :category => 'Print')
series.image = 'pda'
series.save!

series = Series.find_or_create_by_abbreviation(:abbreviation => 'nsb', :name => 'New series (novels)', :category => 'Print')
series.image = 'newseriesbooks'
series.save!

series = Series.find_or_create_by_abbreviation(:abbreviation => 'otherbooks', :category => 'Print', :name => 'Other materials') 
series.image = 'otherbooks'
series.save!

# And now the Doctors
doctor = Doctor.find_or_create_by_id(
  :id => 1, :order => 1,
  :played_by => 'William Hartnell',
  :image => 'doctors/1st-doctor-full.jpg'
)
doctor.label = 'First Doctor'
doctor.icon = 'doctors/1st-doctor-icon.jpg'
doctor.save!

doctor = Doctor.find_or_create_by_id(
  :id => 2, :order => 2,
  :played_by => 'Patrick Troughton',
  :image => 'doctors/2nd-doctor-full.jpg'
)
doctor.label = 'Second Doctor'
doctor.icon = "doctors/2nd-doctor-icon.jpg"
doctor.save!

doctor = Doctor.find_or_create_by_id(
  :id => 3, :order => 3,
  :played_by => 'Jon Pertwee',
  :image => 'doctors/3rd-doctor-full.jpg'
)
doctor.label = 'Third Doctor'
doctor.icon = "doctors/3rd-doctor-icon.jpg"
doctor.save!

doctor = Doctor.find_or_create_by_id(
  :id => 4, :order => 4,
  :played_by => 'Tom Baker',
  :image => 'doctors/4th-doctor-full.jpg'
)
doctor.label = 'Fourth Doctor'
doctor.icon = "doctors/4th-doctor-icon.jpg"
doctor.save!

doctor = Doctor.find_or_create_by_id(
  :id => 5, :order => 5,
  :played_by => 'Peter Davison',
  :image => 'doctors/5th-doctor-full.jpg'
)
doctor.label = 'Fifth Doctor'
doctor.icon = "doctors/5th-doctor-icon.jpg"
doctor.save!

doctor = Doctor.find_or_create_by_id(
  :id => 6, :order => 6,
  :played_by => 'Colin Baker',
  :image => 'doctors/6th-doctor-full.jpg'
)
doctor.label = 'Sixth Doctor'
doctor.icon = "doctors/6th-doctor-icon.jpg"
doctor.save!

doctor = Doctor.find_or_create_by_id(
  :id => 7, :order => 7,
  :played_by => 'Sylvester McCoy',
  :image => 'doctors/7th-doctor-full.jpg'
)
doctor.label = 'Seventh Doctor'
doctor.icon = "doctors/7th-doctor-icon.jpg"
doctor.save!

doctor = Doctor.find_or_create_by_id(
  :id => 8, :order => 8,
  :played_by => 'Paul McGann',
  :image => 'doctors/8th-doctor-full.jpg'
)
doctor.label = 'Eighth Doctor'
doctor.icon = "doctors/8th-doctor-icon.jpg"
doctor.save!

doctor = Doctor.find_or_create_by_id(
  :id => 9, :order => 9,
  :played_by => 'Chrisopher Ecclestone',
  :image => 'doctors/9th-doctor-full.jpg'
)
doctor.label = 'Ninth Doctor'
doctor.icon = "doctors/9th-doctor-icon.jpg"
doctor.save!

doctor = Doctor.find_or_create_by_id(
  :id => 10, :order => 10,
  :played_by => 'David Tennant',
  :image => 'doctors/10th-doctor-full.jpg'
)
doctor.label = 'Tenth Doctor'
doctor.icon = "doctors/10th-doctor-icon.jpg"
doctor.save!

doctor = Doctor.find_or_create_by_id(
  :id => 11, :order => 11,
  :played_by => 'Matt Smith',
  :image => 'doctors/11th-doctor-full.jpg'
)
doctor.label = 'Eleventh Doctor'
doctor.icon = "doctors/11th-doctor-icon.jpg"
doctor.save!