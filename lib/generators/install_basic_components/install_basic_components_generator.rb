class InstallBasicComponentsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :app_name, type: :string
  argument :port_number, :type => :string, :default => "3000"

  def install_devise
  	inside "#{base_path}" do
  		run 'rails generate devise:install'
  	end
  end

  def install_rspec
  	inside "#{base_path}" do
  		run 'rails generate rspec:install'
  	end
  end

  def create_rspec_formatting
  	remove_base_file ".rspec"
  	copy_file "rspec", "#{base_path}.rspec"
  end

  def install_cucumber
  	inside "#{base_path}" do
  		run 'rails generate cucumber:install'
  	end
  end

  def append_cucumber_settings_to_db_yml
  	append_to_file "#{base_path}config/database.yml", "\ncucumber:\n  <<: *test"
  end

  def install_figaro
  	inside "#{base_path}" do
  		run 'rails generate figaro:install'
  	end
  end

  def setup_high_voltage_welcome_page
  	FileUtils.mkdir_p "#{base_path}app/views/pages"
  	copy_file "views/pages/welcome.html.erb", "#{base_path}app/views/pages/welcome.html.erb"
  	inject_root_route
  end

  def configure_devise
  	setup_devise_initializer
  	add_port_info_to_development_config
  	add_flash_messages_for_devise
  end

  def create_devise_resource(resource_name = "User")
  	inside "#{base_path}" do
  		run "rails g devise #{resource_name}"
  	end
  	expose_devise_views
  	migrate_db
  end

  def add_in_devise_test_helpers
  	FileUtils.mkdir_p "#{base_path}spec/support"
  	copy_file "spec/support/devise.rb", "#{base_path}spec/support/devise.rb"
  end

  private

  def remove_base_file(relative_path)
  	remove_file "#{base_path}#{relative_path}"
  end

  def base_path
  	"/Users/lev/Documents/CS/Rails/splice/sample_apps/" + app_name + "/"
  end

  def commit_and_merge_with_master
  	inside "#{base_path}" do
	  	git add: "--all"
	    git commit: "-m 'initial configuration generated and successfully applied to app'"
  	end
  end

  def setup_devise_initializer
  	rel_path = "config/initializers/devise.rb"
  	# this method does nothing right now
  	# this is where the following line should be added:
  	# config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  end

  def add_port_info_to_development_config
  	inject_into_file "#{base_path}config/environments/development.rb",
  																			after: "config.assets.debug = true" do
			<<-BLOCK

	# port number for devise to use for development
	config.action_mailer.default_url_options = { host: 'localhost:#{port_number}' }
			BLOCK
  	end
  end

  def add_flash_messages_for_devise
  	inject_into_file "#{base_path}app/views/layouts/application.html.erb", after: "<body>" do
  		<<-BLOCK
	<% flash.each do |name, msg| %>
		<div class="alert alert-<%= name == :notice ? "success" : "error" %>">
			<a href="" class="close" data-dismiss="alert"></a>
			<%= msg %>
		</div>
	<% end %>
			BLOCK
  	end
  end

  def expose_devise_views
  	inside "#{base_path}" do
  		run "rails g devise:views"
  	end
  end

  def migrate_db
  	inside "#{base_path}" do
  		run "rake db:migrate db:test:prepare"
  	end
  end

  def inject_root_route
  	inject_into_file "#{base_path}config/routes.rb", after: "Application.routes.draw do" do
  		<<-BLOCK

	root to: 'high_voltage/pages#show', id: 'welcome'
			BLOCK
		end
  end

end
