ActiveAdmin.register Abizvn::Clients::Client, as: 'client' do
  permit_params :name, :contact_email, :contact_phone_number, :details, :is_active, :admin_user_id,
                :domains_attributes => [:id, :name, :is_active, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :contact_email
    column :contact_phone_number
    column :admin_user
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :contact_email
      row :contact_phone_number
      row :details
      row :admin_user
      row :is_active
      row :created_at
      row :updated_at
    end

    panel "Domain" do
      table_for resource.domains do |t|
        t.column :id
        t.column :name
        t.column :is_active
        t.column :created_at
        t.column :updated_at
      end
    end

    active_admin_comments
  end

  action_item :create_another, only: :show do
    link_to "Create Another", new_admin_client_path
  end

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names

    f.inputs do
      f.input :name
      f.input :contact_email
      f.input :contact_phone_number
      f.input :details
      # f.input :admin_user, as: :select, collection: AdminUser.all.map { |admin_user| [admin_user.email, admin_user.id] }
      f.input :is_active
    end

    f.inputs "Domains" do
      f.has_many :domains, heading: false, allow_destroy: true, new_record: true do |u|
        u.input :name
        u.input :is_active
      end
    end

    f.actions
  end

end