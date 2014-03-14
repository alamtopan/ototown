class Backend::ApplicationController < InheritedResources::Base
  layout 'application_backend'
  # before_filter :authenticate_admin!
  protect_from_forgery with: :exception
end
