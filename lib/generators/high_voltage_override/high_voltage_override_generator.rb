class HighVoltageOverrideGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :app_name, type: :string
  argument :page_names, type: :array, required: true

  def check_for_and_install_gems
    ############ NOT YET IMPLEMENTED ##################
  	# dependencies = 	%w[ high_voltage, rspec, shoulda ]
  end

  def generate_pages_controller
		copy_base_file "controllers/pages_controller.rb", "app/controllers/pages_controller.rb"
  end

  def override_high_voltage_initializer
  	copy_base_file "initializers/high_voltage.rb", "config/initializers/high_voltage.rb"
  end

  def modify_routes
		inject_into_file "#{base_path}config/routes.rb", before: "root :to" do
			<<-BLOCK
				get "/pages/*id" => 'pages#show', as: :page, format: false

			BLOCK
		end
		gsub_file "#{base_path}config/routes.rb", "high_voltage/pages", "pages"
  end

  def create_spec
		template "specs/pages_controller_spec.rb", "#{base_path}spec/controllers/pages_controller_spec.rb"
  end

  def run_spec
    inside "#{base_path}" do
      if run 'rspec spec/controllers/pages_controller_spec.rb'
        git_commit
      else
        puts "Spec did not pass.  Code will not be committed to repo."
      end
    end
  end

  private

  def remove_base_file(relative_path)
    remove_file "#{base_path}#{relative_path}"
  end

  def copy_base_file(src, dest)
    copy_file src, "#{base_path}#{dest}"
  end

  def base_path
    "/Users/lev/git/github/splice/sample_apps/" + app_name + "/"
  end

  def git_commit
  	git add: "--all"
    git commit: "-m 'generate high_voltage_override for dynamic page layouts'"
  end

end
