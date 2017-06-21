class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from StandardError, :with => :handle_error

  def handle_error(e)
    Rails.logger.error e.message
    Rails.logger.error e.backtrace
    puts e.message
    puts e.backtrace
    result = {}
    result[:error_code] = e.message
    result[:error_msg] = e.backtrace.join("<br/>") unless e.class == RuntimeError 
    respond_to do |format|
      format.html{ render :text => result }
    end
  end
end
