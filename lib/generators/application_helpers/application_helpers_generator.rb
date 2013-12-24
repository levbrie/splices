class ApplicationHelpersGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :app_name, type: :string

  def generate_helpers
  	remove_base_file "app/helpers/application_helper.rb"
  	template "application_helper.rb", "#{base_path}app/helpers/application_helper.rb"
  end

  def git_commit
    inside "#{base_path}" do
      git add: "--all"
      git commit: "-m 'generate useful helpers for Rails views and controllers'"
    end
  end

  private

  def remove_base_file(relative_path)
    remove_file "#{base_path}#{relative_path}"
  end

  def base_path
    "/Users/lev/Documents/CS/Rails/splice/sample_apps/" + app_name + "/"
  end
end
