class UpdateDomainsClientToOptional < ActiveRecord::Migration[7.2]
  def change
    change_column_null :clients_management_domains, :client_id, true
  end
end
