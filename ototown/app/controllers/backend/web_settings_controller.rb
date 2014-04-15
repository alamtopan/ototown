class Backend::WebSettingsController < Backend::ApplicationController
  defaults :resource_class => WebSetting, :collection_name => 'web_settings', :instance_name => 'web_settings'
end