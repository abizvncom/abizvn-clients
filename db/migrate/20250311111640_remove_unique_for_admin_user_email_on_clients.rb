class RemoveUniqueForAdminUserEmailOnClients < ActiveRecord::Migration[7.2]
  def change
    remove_index :clients_management_clients, :admin_user_email
  end
end
