class AuthenticationPortalGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  # make generator NAME arg optional, default to application
  argument :app_name, type: :string
  argument :devise_model_name, type: :string, default: "user"

  def generate_portal
  	remove_current_devise_files
  	template_with_base "layouts/authentication.html.erb", "app/views/layouts/authentication.html.erb"
  	template_with_base "devise/registrations/edit.html.erb", "#{view_path}/registrations/edit.html.erb"
  	template_with_base "devise/registrations/new.html.erb", "#{view_path}/registrations/new.html.erb"
  	template_with_base "devise/sessions/new.html.erb", "#{view_path}/sessions/new.html.erb"
  end

  def inject_dynamic_layout
  	inject_into_file "#{base_path}app/controllers/application_controller.rb",
  										after: "protect_from_forgery with: :exception\n" do
	  	<<-RUBY
  layout :layout_by_resource

  protected

  def layout_by_resource
    if user_signed_in?
      "application"
    else
      "authentication"
    end
  end
			RUBY
		end
  end

  def git_commit
    inside "#{base_path}" do
      git add: "--all"
      git commit: "-m 'generate authorization portal for sign in and sign up'"
    end
  end

  private

  def remove_base_file(relative_path)
    remove_file "#{base_path}#{relative_path}"
  end

  def copy_base_file(src, dest)
    copy_file src, "#{base_path}#{dest}"
  end

  def template_with_base(src, dest)
    template src, "#{base_path}#{dest}"
  end

  def base_path
    "/Users/lev/git/github/splice/sample_apps/" + app_name + "/"
  end

  def remove_current_devise_files
		remove_file "#{base_path}#{view_path}/registrations/edit.html.erb"
  	remove_file "#{base_path}#{view_path}/registrations/new.html.erb"
  	remove_file "#{base_path}#{view_path}/sessions/new.html.erb"
  end

  def devise_name
  	devise_model_name.underscore
  end

  def view_path
  	"app/views/devise"
  end
end