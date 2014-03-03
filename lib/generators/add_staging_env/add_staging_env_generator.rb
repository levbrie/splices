require 'splice/actions'

class AddStagingEnvGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  include Splice::Actions

  argument :app_name, type: :string
  argument :env_name, type: :string, default: "staging"

  def create_env_config_file
    env_file = "#{base_path}config/environments/#{env_name}.rb"
    copy_file 'staging.rb', env_file

    db_yml_config = %{

#{env_name}:
  adapter: postgresql
  encoding: unicode
  database: #{app_name}_#{env_name}
  pool:
  timeout: 5000
    }

    append_file "#{base_path}config/database.yml", db_yml_config
  end

  def set_config_log_level
  end
end
