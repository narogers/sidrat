class BroadcastValidator < ActiveModel::Validator
  def validate(record)
    end_of_range = DateTime.now + (5*365)
    puts "Validating broadcast information for #{record}"
    
    unless ['unaired', 'broadcast'].include?(record.broadcast_status)
      record.errors.add(:broadcast_status, "The current status is not valid. Please select again.")
    end
    
    if !record.broadcast_starting.nil? and record.broadcast_starting <=   Date.new(record.series.series_started_on, 1, 1)
      record.errors.add(:broadcast_starting, "The entry must have been originally released between #(record.series.series_started_on} and #{record.series.series_ended_on}")
    end

    # Dates must be no more than five years in the future
    if !record.broadcast_starting.nil? and record.broadcast_starting > Date.new(record.series.series_ended_on, 12, 31)
      record.errors.add(:broadcast_starting, "The broadcast date must be between 1963 and #{record.series.series_ended_on}")
    end
    
    if !record.broadcast_ending.nil? and record.broadcast_ending < record.broadcast_starting
      record.errors.add(:broadcast_ending, 'The broadcast dates appear to be reversed.')
    end

    if !record.broadcast_ending.nil? and record.broadcast_ending > end_of_range
      record.errors.add(:broadcast_ending, 'The broadcast end date is too far in the future.')
    end
  end
end

