class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :text
      t.references :ticket, index: true, foreign_key: true, type: :uuid
      t.references :author, null: false, foreign_key: { to_table: :users }, type: :uuid, index: true

      t.timestamps
    end
  end
end
