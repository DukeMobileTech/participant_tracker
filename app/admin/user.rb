ActiveAdmin.register User do
  menu priority: 3
  permit_params :email, :password, :password_confirmation, project_ids: []

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

  show do |user|
    attributes_table do
      row :id
      row :email
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
      row :authentication_token
      row 'User Projects' do
        ul do
          user.projects.each do |project|
            li { project.name }
          end
        end
      end
    end

    active_admin_comments
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      unless current_page?(new_admin_user_path)
        f.input :projects, as: :check_boxes, collection: Project.all
      end
    end
    f.actions
  end

  controller do
    def update
      user = User.find(params[:id])
      if params[:user].blank? || params[:password].blank? || params[:password_confirmation].blank?
        user.update_without_password(user_params)
      else
        user.update_attributes(user_params)
      end
      if user.errors.blank?
        redirect_to admin_user_path(params[:id]), notice: 'User updated successfully.'
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, project_ids: [])
    end
  end
end
