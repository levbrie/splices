class InitialConfigurationGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :app_name, type: :string

  def use_markdown_for_readme
  	remove_file "#{base_path}README.rdoc"
  	copy_file		"README.md", "#{base_path}/README.md"
  end

  def use_augmented_gitignore
  	remove_file "#{base_path}.gitignore"
  	copy_file 	"gitignore", "#{base_path}.gitignore"
  end

  def provide_setup_script
    copy_file "bin_setup", "#{base_path}bin/setup"
    inside "#{base_path}" do
      run 'chmod a+x bin/setup'
    end
  end

  def configure_generators
    config = <<-RUBY
  config.generators do |generate|
    generate.helper false
    generate.javascript_engine false
    generate.request_specs false
    generate.routing_specs false
    generate.stylesheets false
    generate.test_framework :rspec
    generate.view_specs false
  end

    RUBY

    inject_into_class "#{base_path}config/application.rb", "Application", config
  end

  def configure_smtp
      copy_file 'config/initializers/smtp.rb', "#{base_path}config/initializers/smtp.rb"

      prepend_file 'config/environments/production.rb',
        "require Rails.root.join('config/initializers/smtp')\n"

      config = <<-RUBY

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = SMTP_SETTINGS
      RUBY

    inject_into_file 'config/environments/production.rb', config,
      :after => 'config.action_mailer.raise_delivery_errors = false'
  end

  def configure_database_yaml
  	remove_file "#{base_path}config/database.yml"
  	template "config/database.yml.erb", "#{base_path}config/database.yml"
  end

  def git_init_repo
  	inside "#{base_path}" do
	  	git :init
	  	git add: "--all"
	  	git commit: "-m 'initial commit'"
	  end
  end

  def bundle_app
  	inside "#{base_path}" do
  		run 'bundle'
  	end
  end

  def create_and_migrate_db
  	inside "#{base_path}" do
  		run 'rake db:create'
  		run 'rake db:migrate db:test:prepare'
  	end
  end

  def run_spec
	  commit_and_merge_with_master
  end

  private

  def base_path
  	"/Users/lev/Documents/CS/Rails/splice/sample_apps/" + app_name + "/"
  end

  def commit_and_merge_with_master
  	inside "#{base_path}" do
	  	git add: "--all"
	    git commit: "-m 'initial configuration generated and successfully applied to app'"
  	end
  end
end
