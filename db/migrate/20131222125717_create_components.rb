class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.text :description
      t.string :repository_url
      t.string :component_path

      t.timestamps
    end
  end
end
