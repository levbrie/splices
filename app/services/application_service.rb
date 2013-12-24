class ApplicationService

	attr_reader :app_name

	def initialize(app_name)
		@app_name = app_name
	end

	def create_app
		`rails generate create_and_setup_app #{app_name}`
	end
end