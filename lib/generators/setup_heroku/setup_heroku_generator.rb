require 'splice/actions'

class SetupHerokuGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  include Splice::Actions
  argument :app_name, type: :string
  class_option :staging, type: :boolean, default: true, description: "Also create staging app"

  def heroku_create_apps
    inside "#{base_path}" do
      run "bundle install"
      run "heroku create #{app_name}-production --remote=production"
      run "heroku create #{app_name}-staging --remote=staging"
      run "heroku config:add RACK_ENV=staging RAILS_ENV=staging --remote=staging"
    end
  end

  def heroku_set_remotes
    remotes = <<-RUBY

# Set up staging and production git remotes
git remote add staging git@heroku.com:#{app_name}-staging.git
git remote add production git@heroku.com:#{app_name}-production.git
    RUBY

    append_file "#{base_path}bin/setup", remotes
  end

end
