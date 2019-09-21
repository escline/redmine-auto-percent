require 'redmine'

ActiveSupport::Reloader.to_prepare do
  require_dependency 'issue'
  # Guards against including the module multiple time (like in tests)
  # and registering multiple callbacks
  unless Issue.included_modules.include? RedmineAutoPercent::IssuePatch
    Issue.send(:include, RedmineAutoPercent::IssuePatch)
  end
end

Redmine::Plugin.register :redmine_auto_percent do
  name 'Redmine Auto Done 100%'
  author 'Wade Womersley'
  description 'Automatically sets 100% done on Resolved or Closed'
  version '0.0.1'
  url ''
  author_url 'http://www.xcitestudios.com/'
end
