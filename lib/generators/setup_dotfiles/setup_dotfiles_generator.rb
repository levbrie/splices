require 'splice/actions'

class SetupDotfilesGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  include Splice::Actions

  argument :app_name, type: :string

  def add_dotfiles
    copy_file "ruby-version", "#{base_path}.ruby-version"
    copy_file "ruby-gemset", "#{base_path}.ruby-gemset"
    append_file "#{base_path}.ruby-gemset", app_name
  end

  def add_guardfile
    copy_file "Guardfile", "#{base_path}Guardfile"
  end
end
