class AssetsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_over_vendor_assets
  	copy_over_vendor_javascripts
  	copy_over_vendor_stylesheets
  end

  def add_gems_to_gemfile
  	gem 'jquery-ui-rails', '2.0.2'
  	gem 'momentjs-rails' 								# client-side time formatting
  	gem 'rickshaw_rails'                # graphing with scatter plots
  end

  def generate_js_manifest
  	remove_file "app/assets/javascripts/application.js"
  	copy_file 	"javascripts/application.js.coffee", "app/assets/javascripts/application.js.coffee"
  end

  def generate_stylesheets_manifest
  	remove_file "app/assets/stylesheets/application.css"
  	copy_file 	"stylesheets/application.css", "app/assets/stylesheets/application.css"
  	copy_file 	"stylesheets/main.css.scss", "app/assets/stylesheets/main.css.scss"
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
  	puts "Copying over vendor javascripts..."
  	puts "File path: #{file_path}/vendor/javascripts/*"
  	FileUtils.cp_r "#{file_path}/vendor/javascripts/", 'vendor/assets'
  end

  def copy_over_vendor_stylesheets
  	puts "Copying over vendor stylesheets..."
  	puts "File path: #{file_path}/vendor/stylesheets/*"
  	FileUtils.cp_r "#{file_path}/vendor/stylesheets/", 'vendor/assets'
  end

  def file_path
  	File.expand_path('../templates', __FILE__)
  end

  # def mk_layout_dirs
  # 	FileUtils.mkdir_p "#{view_path}head"
  # 	FileUtils.mkdir_p "#{view_path}frame"
  # 	FileUtils.mkdir_p "#{view_path}content"
  # 	FileUtils.mkdir_p "app/views/shared"
  # end
end
