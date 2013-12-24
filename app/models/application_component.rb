class ApplicationComponent < ActiveRecord::Base
  belongs_to :application
  belongs_to :component
end
