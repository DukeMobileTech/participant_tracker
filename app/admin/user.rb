ActiveAdmin.register User do
  menu priority: 3
  permit_params :email, :password, :password_confirmation

  index do 
    selectable_column
    id_column
    column :email
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    column :created_at
    column :updated_at
    actions
  end
  
  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  
end
