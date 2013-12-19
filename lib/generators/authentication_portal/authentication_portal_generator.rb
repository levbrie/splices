class AuthenticationPortalGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  # make generator NAME arg optional, default to application
  argument :devise_model_name, type: :string, default: "user"

  def generate_portal
  	remove_current_devise_files
  	template "layouts/authentication.html.erb", "app/views/layouts/authentication.html.erb"
  	template "devise/registrations/edit.html.erb", "#{view_path}/registrations/edit.html.erb"
  	template "devise/registrations/new.html.erb", "#{view_path}/registrations/new.html.erb"
  	template "devise/sessions/new.html.erb", "#{view_path}/sessions/new.html.erb"
  end

  def inject_dynamic_layout
  	inject_into_file 'app/controllers/application_controller.rb',
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
    git add: "--all"
    git commit: "-m 'generate authorization portal for sign in and sign up'"
  end

  private

  def remove_current_devise_files
		remove_file "#{view_path}/registrations/edit.html.erb"
  	remove_file "#{view_path}/registrations/new.html.erb"
  	remove_file "#{view_path}/sessions/new.html.erb"
  end

  def devise_name
  	devise_model_name.underscore
  end

  def view_path
  	"app/views/devise"
  end
end