class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
			  layout :layout_by_resource

			  protected

			  # admin layout for admins only
			  def layout_by_resource
			    if user_signed_in?                   # users are admins in this app
			      "application"
			    else
			      "authentication"
			    end
			  end
end
