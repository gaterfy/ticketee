class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets, id: :uuid do |t|
      t.string :name
      t.text :description
      t.references :project, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
