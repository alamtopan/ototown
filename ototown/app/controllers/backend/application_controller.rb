class Backend::ApplicationController < ActionController::Base
  layout 'application_backend'
  before_filter :authenticate_backend_admin!
  protect_from_forgery with: :exception
end
