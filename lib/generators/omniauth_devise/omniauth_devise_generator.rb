class OmniauthDeviseGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :provider_name, type: :string, default: "github"

  def generate_omniauth_migration
  	generate migration add_omniauth_columns_to_users provider uid name avatar_url html_url repos_url
  end

  def add_omniauth_gems
  	gem 'omniauth'
  	gem "omniauth-#{provider_name}"
  end

  def add_omniauth_to_devise_config
  	gsub_file "config/initializers/devise.rb",
  						"# config.omniauth :github, 'APP_ID', 'APP_SECRET', :scope => 'user,public_repo'",
  						"config.omniauth :#{provider_name}, '#{app_id_env}', '#{app_secret_env}' # ADD OMNIAUTH"
  end

  private

  def app_id_env
  	"ENV[#{provider_caps}_APP_ID]"
  end

  def app_secret_env
  	"ENV[#{provider_caps}_APP_SECRET]"
  end

  def provider_caps
  	provider_name.upcase
  end
end
