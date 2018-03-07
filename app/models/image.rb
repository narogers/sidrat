class Image
  attr :converted
  attr_reader :file, :full, :icon, :extension
  attr_accessor :prefix
  
  def initialize(source)
    @file = source
    determine_extension
    
    converted = false
  end
  
  def convert
    unique_key = unique_id
    @icon = "#{@prefix}-icon-#{unique_key}" << extension 
    @full = "#{@prefix}-full-#{unique_key}" << extension
    
    image = MiniMagick::Image.open(file.tempfile.path)
    image.resize("x200")
    image.write("#{Rails.root}/tmp/images/#{@icon}")
    
    FileUtils.mv(file.tempfile.path, "#{Rails.root}/tmp/images/#{@full}")
    @converted = true
  end
  
  # Silent failures are bad but that can wait for another day
  def copy(destination)
    return unless @converted
    
    puts "Generating #{Rails.root}/tmp/images/#{@full}"
    puts "Generating #{Rails.root}/tmp/images/#{@icon}"
    
    FileUtils.cp("#{Rails.root}/tmp/images/#{@full}", 
      "#{destination}/#{@full}")
    puts "Moving #{destination}/#{@full}"
    
    FileUtils.chmod(0644, "#{destination}/#{@full}")
    FileUtils.cp("#{Rails.root}/tmp/images/#{@icon}",
      "#{destination}/#{@icon}")
    puts "Moving #{destination}/#{@icon}"
    FileUtils.chmod(0644, "#{destination}/#{@icon}")
  end
  
  def destroy
    return unless @converted
    
    FileUtils.rm("#{Rails.root}/tmp/images/#{@full}")
    FileUtils.rm("#{Rails.root}/tmp/images/#{@icon}")
  end
  
  private
  def determine_extension
    @extension = case @file.content_type 
      when 'image/png' then '.png'
      when 'image/jpeg' then '.jpg'
      when 'image/jpg' then '.jpg'
      else nil
    end
  end
  
  def unique_id
    puts "Timestamp is << " << Time.now.strftime('%S%M%H%j') << " >>"
    timestamp = Time.now.strftime("%S%M%L%H%j").to_i(16)
    return timestamp
  end
end
