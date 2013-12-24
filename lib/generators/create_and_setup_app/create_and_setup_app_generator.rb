class CreateAndSetupAppGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :app_name, type: :string

  def create_app
  	inside "#{initial_path}" do
  		run "rails new #{app_name} --skip-bundle"
  	end
  end

  def add_gemfile
  	remove_file "#{base_path}Gemfile"
    copy_file "Gemfile", "#{base_path}Gemfile"
  end

  def run_initial_configuration
  	run "rails generate initial_configuration #{app_name}"
  end

  def install_basic_components
  	run "rails generate install_basic_components #{app_name}"
  end

  private

  def initial_path
  	"/Users/lev/Documents/CS/Rails/splice/sample_apps/"
  end

  def base_path
  	"/Users/lev/Documents/CS/Rails/splice/sample_apps/" + app_name + "/"
  end
end
