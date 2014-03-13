class Backend::ApplicationController < InheritedResources::Base
  layout 'application_backend'
  protect_from_forgery with: :exception
end
