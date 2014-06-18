ActiveAdmin.register ApiKey do

  index do
    column :id
    column :access_token
    default_actions
  end

  filter :access_token
  
  show do |user|
    attributes_table do
      row :id
      row :access_token
    end

    active_admin_comments
  end

  form do |f|
    f.actions
  end
end