class AssetsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_over_vendor_assets
  	copy_over_vendor_javascripts
  	copy_over_vendor_stylesheets
  end

  def add_gems_to_gemfile
  	gem 'momentjs-rails' 								# client-side time formatting
  	gem 'rickshaw_rails'                # graphing with scatter plots
  end

  def generate_js_manifest
  	remove_file "app/assets/javascripts/application.js"
  	copy_file "javascripts/application.js.coffee", "app/assets/javascripts/application.js.coffee"
  end

  def generate_stylesheets_manifest
  	remove_file "app/assets/stylesheets/application.css"
  	copy_file "stylesheets/application.css", "app/assets/stylesheets/application.css"
  	copy_file "stylesheets/main.css.scss", "app/assets/stylesheets/main.css.scss"
  end

  def git_commit
		git add: "--all"
		git commit: "-m 'add vendor assets and update asset pipeline'"
  end

  def run_bundler
  	run 'bundle install'
  end

  private

  def copy_over_vendor_javascripts
  	Dir["vendor/javascripts/*"].each do |source|
  		destination = "vendor/assets/javascripts/#{File.basename(source)}"
  		add_if_new(source, destination)
  	end
  end

  def copy_over_vendor_stylesheets
  	Dir["vendor/stylesheets/*"].each do |source|
  		destination = "vendor/assets/stylesheets/#{File.basename(source)}"
  		add_if_new(source, destination)
  	end
  end

  def add_if_new(source, destination)
		if File.exist?(destination)
			puts "Skipping #{destination} because it already exists"
		else
			puts "Adding #{destination} to vendor assets..."
			FileUtils.cp(source, destination)
		end
  end

  # def mk_layout_dirs
  # 	FileUtils.mkdir_p "#{view_path}head"
  # 	FileUtils.mkdir_p "#{view_path}frame"
  # 	FileUtils.mkdir_p "#{view_path}content"
  # 	FileUtils.mkdir_p "app/views/shared"
  # end
end
