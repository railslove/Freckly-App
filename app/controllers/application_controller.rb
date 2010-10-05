class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :http_authenticate if Rails.env == "production"

  private

  def http_authenticate
    authenticate_or_request_with_http_basic do |login, password|
      login == LOGIN && password == PASSWORD
    end
  end
end
