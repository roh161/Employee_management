ActiveAdmin.register AdminUser do
  role_changeable
  permit_params :email, :password, :password_confirmation, :department_id, :role, educations_attributes: [:id, :institution_name, :level, :qualification, :start_year, :completed_year, :specialization, :_destroy], experiences_attributes: [:id, :company, :position, :start_date, :end_date, :_destroy]

  menu label: 'Admin User', if: proc { current_admin_user.admin_user? }

  # actions :all, :except => [:edit]

  controller do
    def scoped_collection
      if current_admin_user.staff?
        AdminUser.where(id: current_admin_user.id)
      else
        AdminUser.all
      end
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :department_id do |obj|
      department = Department.find_by(id: obj.department_id)
      department.department_name if department
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      if resource.staff?
        row :profile_image do |image|
          if image.profile_image.attached?
            div class: 'circular-profile-image' do
              image_tag(image.profile_image, class: 'profile-image')
            end
          else
            content_tag(:span, 'No Image')
          end
        end
      end
      
      row :email
      row :role 
      row :department_id do |obj|
        department = Department.find_by(id: obj.department_id)
        department.department_name if department
      end
      row :created_at
      row :updated_at  
      
      if resource.staff?
        panel 'Educations' do
          table_for resource.educations do
            column :institution_name
            column :level
            column :qualification
            column :start_year
            column :completed_year
            column :specialization
          end
        end
  
        panel 'Experiences' do
          table_for resource.experiences do
            column :company
            column :position
            column :start_date
            column :end_date
          end
        end
      end
    end
  end

  filter :email
  filter :role
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      if current_admin_user.admin_user?
        f.input :role
        f.input :department, as: :select, collection: Department.all.map { |dept| [dept.department_name, dept.id] }
      end
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
    

end
