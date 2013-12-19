class ApplicationHelpersGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :app_name, type: :string, default: "App"

  def generate_helpers
  	remove_file "app/helpers/application_helper.rb"
  	template "application_helper.rb", "app/helpers/application_helper.rb"
  end

  def git_commit
    git add: "--all"
    git commit: "-m 'generate useful helpers for Rails views and controllers'"
  end
end
