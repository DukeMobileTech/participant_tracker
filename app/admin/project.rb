ActiveAdmin.register Project do
  permit_params :name, :description

  show do |project|
    attributes_table do
      row :id
      row :name
      row :description
      row :created_at
      row :updated_at
      row :users do
        ul do
          project.users.each do |user|
            li { user.email }
          end
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Project Details' do
      f.input :name
      f.input :description
    end
    f.actions
  end
end
