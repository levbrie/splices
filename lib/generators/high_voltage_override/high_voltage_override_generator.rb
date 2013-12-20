class HighVoltageOverrideGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :page_names, type: :array, required: true

  def check_for_and_install_gems
  	dependencies = 	%w[ high_voltage, rspec, shoulda ]
  end

  def generate_pages_controller
		copy_file "controllers/pages_controller.rb", "app/controllers/pages_controller.rb"

  end

  def override_high_voltage_initializer
  	copy_file "initializers/high_voltage.rb", "config/initializers/high_voltage.rb"
  end

  def modify_routes
		inject_into_file "config/routes.rb", before: "root :to" do
			<<-BLOCK
				get "/pages/*id" => 'pages#show', as: :page, format: false

			BLOCK
		end
		gsub_file "config/routes.rb", "high_voltage/pages", "pages"
  end

  def create_spec
		template "specs/pages_controller_spec.rb", "spec/controllers/pages_controller_spec.rb"
  end

  def run_spec
  	if run 'rspec spec/controllers/pages_controller_spec.rb'
  		git_commit
  	else
  		puts "Spec did not pass.  Code will not be committed to repo."
  	end
  end

  private

  def git_commit
  	git add: "--all"
    git commit: "-m 'generate high_voltage_overries for dynamic page layouts'"
  end

end
