class AppGrafter

	attr_reader :app_name, :component_name

  def initialize(app, component)
  	@app_name = app.name.underscore
  	@component_name = component.name.underscore
  end

  def create_graft
  	case component_name
  	when "layout" then gen("layout #{app_name} --force")
  	when "application_helpers" then gen("application_helpers #{app_name}")
  	when "assets" then gen("assets #{app_name}")
  	when "authentication_portal" then gen("authentication_portal #{app_name}")
  	when "high_voltage_override" then gen("high_voltage_override #{app_name} welcome")
  	else
  		"didn't understand"
  	end
  end

  private

  def gen(arg_string)
  	`rails generate #{arg_string}`
	end
end
