class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states, id: :uuid  do |t|
      t.string :name
      t.string :color
    end

    add_reference :tickets, :state, type: :uuid, index: true, foreign_key: true
    add_reference :comments, :state, type: :uuid, foreign_key: true
  end
end
