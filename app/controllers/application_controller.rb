class ApplicationController < ActionController::API
    include ActionController::MimeResponds
  def not_found
    head 404
  end
end
