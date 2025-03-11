class AddingClientsTable < ActiveRecord::Migration[7.2]
  def change
    create_table :clients_management_clients do |t|
      t.string :name, null: false, limit: 128
      t.index :name, unique: true

      t.string :admin_user_email, null: false
      t.index :admin_user_email, unique: true
      
      t.string :contact_email
      t.string :contact_phone_number
      t.text :details
    
      t.boolean :is_active, null: false, default: false

      t.timestamps
    end
  end
end
