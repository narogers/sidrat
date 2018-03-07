class ImageValidator < ActiveModel::Validator
  def validate(record)
    # If there is nothing to validate then save some time
    return if record.uploaded_image.nil?
    
    record.errors[:uploaded_image] <<
      "The uploaded file is too large (#{record.uploaded_image.size} bytes)" if record.uploaded_image.size > 500*(2**10)
    record.errors[:uploaded_image] <<
      "The content type is invalid (#{record.uploaded_image.content_type})" unless record.uploaded_image.content_type =~ /^image\/(jpe?g|png)/
  end
end
