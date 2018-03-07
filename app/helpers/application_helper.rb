module ApplicationHelper
  def format(text)
    BlueCloth.new(text).to_html.html_safe
  end
  
  def featuring(doctors=nil, companions=nil)
    base_string = ''
    
    unless doctors.nil? and companions.nil?
      unless doctors.nil? or doctors.length == 0
        # First Doctor in the list
        base_string << 'The '
        base_string << doctors.pop.label
        # All Doctors in the middle until the final entry
        until doctors.length < 2
          base_string << ', the ' << doctors.pop.label
        end
        # As long as there are more than one
        unless doctors.length == 0
          base_string << ' and the ' << doctors.pop.label
        end
        # And finally if there are companions
        unless companions.length == 0
          base_string << ' with '
        end
      end
      
      unless companions.nil? or companions.length == 0
        if companions.length <= 3
          base_string << companions.pop.name
          # All companions in the middle until the final entry
          until companions.length < 2
            base_string << ',  ' << companions.pop.name
          end
          # As long as there are more than one
          unless companions.length == 0
            base_string << ' and ' << companions.pop.name
          end
        else
          base_string << 'multiple companions'
        end
      end
    else
      base_string << ' nobody'
    end
    
    return base_string
  end
  
  def written_by(contributors=nil)
    logger.debug("Contributors => #{contributors}")
    
    base_string = ''
    unless contributors.nil? or 0 == contributors.length 
      if contributors.length >= 3
        base_string << 'various contributors'
      else
        base_string << contributors.pop.name
        until contributors.length <= 1
          base_string << ', ' << contributors.pop.name
        end
        unless contributors.length == 0
          base_string << ' and ' << contributors.pop.name
        end
      end
    else
      base_string = 'Unknown'
    end
    
    return base_string
  end
  # END written_by method
end
