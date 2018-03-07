# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Sidrat::Application.initialize!

# Fix some problems with the way that errors are presented in forms
ActionView::Base.field_error_proc = Proc.new { |html_tag, instance| "<span class='fieldWithErrors'>#{html_tag}</span>".html_safe }