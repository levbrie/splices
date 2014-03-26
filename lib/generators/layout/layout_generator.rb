class LayoutGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  # make generator NAME arg optional, default to application
  # also needed to change inherited base from Rails::Generators::NamedBase
  # to Rails::Generators::Base
  argument :app_name, type: :string
  argument :layout_name, type: :string, default: "application"

  def generate_layout
  	template_with_base "layout.html.erb", "#{view_path}#{file_name}.html.erb"
  	mk_layout_dirs
  	template_with_base 	"head/head.html.erb", "#{view_path}head/_head.html.erb"
  	copy_base_file "head/shim.html.erb", "#{view_path}head/_shim.html.erb"
  	template_with_base 	"frame/sidebar.html.erb", "#{view_path}frame/_#{file_name}_sidebar.html.erb"
  	template_with_base 	"frame/header.html.erb", "#{view_path}frame/_header.html.erb"
  	copy_base_file	"shared/search.html.erb", "app/views/shared/_search.html.erb"
  	template_with_base 	"frame/auth.html.erb", "#{view_path}frame/_auth.html.erb"
  	template_with_base 	"frame/modal_contact.html.erb", "#{view_path}frame/_modal_contact.html.erb"
  	template_with_base 	"content/body.html.erb", "#{view_path}content/_#{file_name}_body.html.erb"
  	template_with_base	"shared/notifications.html.erb", "app/views/shared/_notifications.html.erb"
  end

  def git_commit
    git add: "--all"
    git commit: "-m 'generate layout and ui frame for application'"
  end

  private

  def remove_base_file(relative_path)
    remove_file "#{base_path}#{relative_path}"
  end

  def copy_base_file(src, dest)
    copy_file src, "#{base_path}#{dest}"
  end

  def template_with_base(src, dest)
    template src, "#{base_path}#{dest}"
  end

  def base_path
    "/Users/lev/git/github/splice/sample_apps/" + app_name + "/"
  end

  def file_name
  	layout_name.underscore
  end

  def view_path
  	"app/views/layouts/"
  end

  def mk_layout_dirs
  	FileUtils.mkdir_p "#{base_path}#{view_path}head"
  	FileUtils.mkdir_p "#{base_path}#{view_path}frame"
  	FileUtils.mkdir_p "#{base_path}#{view_path}content"
  	FileUtils.mkdir_p "#{base_path}app/views/shared"
  end
end
