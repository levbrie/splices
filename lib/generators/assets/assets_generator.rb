class AssetsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :app_name, type: :string

  def copy_over_vendor_assets
  	copy_over_vendor_javascripts
  	copy_over_vendor_stylesheets
  end

  def add_gems_to_gemfile
  	# gem 'jquery-ui-rails', '2.0.2'
  	# gem 'momentjs-rails' 								# client-side time formatting
  	# gem 'rickshaw_rails'                # graphing with scatter plots
  end

  def generate_js_manifest
  	remove_base_file "app/assets/javascripts/application.js"
  	copy_base_file 	"javascripts/application.js.coffee", "app/assets/javascripts/application.js.coffee"
  end

  def generate_stylesheets_manifest
  	remove_base_file "app/assets/stylesheets/application.css"
  	copy_base_file 	"stylesheets/application.css", "app/assets/stylesheets/application.css"
  	copy_base_file 	"stylesheets/main.css.scss", "app/assets/stylesheets/main.css.scss"
  end

  def git_commit
    inside "#{base_path}" do
  		git add: "--all"
  		git commit: "-m 'add vendor assets and update asset pipeline'"
    end
  end

  def run_bundler
    # inside "#{base_path}" do
    #   run 'bundle install'
    # end
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

  def copy_over_vendor_javascripts
  	puts "Copying over vendor javascripts..."
  	puts "File path: #{file_path}/vendor/javascripts/*"
  	FileUtils.cp_r "#{file_path}/vendor/javascripts/", "#{base_path}vendor/assets"
  end

  def copy_over_vendor_stylesheets
  	puts "Copying over vendor stylesheets..."
  	puts "File path: #{file_path}/vendor/stylesheets/*"
  	FileUtils.cp_r "#{file_path}/vendor/stylesheets/", "#{base_path}vendor/assets"
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
