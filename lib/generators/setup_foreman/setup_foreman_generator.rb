require 'splice/actions'

class SetupForemanGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  include Splice::Actions

  argument :app_name, type: :string

  def copy_procfile
    copy_file "Procfile", "#{base_path}Procfile"
  end
end
