class LayoutGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  # make generator NAME arg optional, default to application
  # also needed to change inherited base from Rails::Generators::NamedBase
  # to Rails::Generators::Base
  argument :layout_name, type: :string, default: "application"

  def generate_layout
  	template "layout.html.erb", "#{view_path}#{file_name}.html.erb"
  	mk_layout_dirs
  	template 	"head/head.html.erb", "#{view_path}head/_head.html.erb"
  	copy_file "head/shim.html.erb", "#{view_path}head/_shim.html.erb"
  	template 	"frame/sidebar.html.erb", "#{view_path}frame/_#{file_name}_sidebar.html.erb"
  	template 	"frame/header.html.erb", "#{view_path}frame/_header.html.erb"
  	copy_file	"shared/search.html.erb", "app/views/shared/_search.html.erb"
  	template 	"frame/auth.html.erb", "#{view_path}frame/_auth.html.erb"
  	template 	"frame/modal_contact.html.erb", "#{view_path}frame/_modal_contact.html.erb"
  	template 	"content/body.html.erb", "#{view_path}content/_#{file_name}_body.html.erb"
  	template	"shared/notifications.html.erb", "app/views/shared/_notifications.html.erb"
  end

  private

  def file_name
  	layout_name.underscore
  end

  def view_path
  	"app/views/layouts/"
  end

  def mk_layout_dirs
  	FileUtils.mkdir "#{view_path}head"
  	FileUtils.mkdir "#{view_path}frame"
  	FileUtils.mkdir "#{view_path}content"
  	FileUtils.mkdir "app/views/shared"
  end
end
