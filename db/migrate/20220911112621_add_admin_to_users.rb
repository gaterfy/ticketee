class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.column :admin, :boolean, null:false, default: false
      t.string :firstname
      t.string :lastname
      t.string :phone
    end
  end
end
