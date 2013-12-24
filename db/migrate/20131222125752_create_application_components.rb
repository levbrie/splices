class CreateApplicationComponents < ActiveRecord::Migration
  def change
    create_table :application_components do |t|
      t.belongs_to :application, index: true
      t.belongs_to :component, index: true

      t.timestamps
    end
  end
end
