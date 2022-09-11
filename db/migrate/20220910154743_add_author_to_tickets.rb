class AddAuthorToTickets < ActiveRecord::Migration[7.0]
  def change
    change_table :tickets do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }, type: :uuid, index: true
    end
  end
end
