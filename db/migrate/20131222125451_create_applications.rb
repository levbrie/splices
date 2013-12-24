class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.text :description
      t.string :repository_url
      t.string :framework

      t.timestamps
    end
  end
end
