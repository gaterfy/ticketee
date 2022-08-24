class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :projects, id: :uuid do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
