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
