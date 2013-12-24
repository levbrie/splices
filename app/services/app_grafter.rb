class AppGrafter

	attr_reader :app_name, :component_name

  def initialize(app, component)
  	@app_name = app.name.underscore
  	@component_name = component.name.underscore
  end

  def create_graft
  	case component_name
  	when "layout" then generate("layout #{app_name}")
  	when "application_helpers" then generate("application_helpers #{app_name}")
  	when "assets" then generate("assets #{app_name}")
  	when "authentication_portal" then generate("authentication_portal #{app_name}")
  	else
  		"didn't understand"
  	end
  end

  private

  def generate(arg_string)
  	`rails generate #{arg_string}`
	end
end
