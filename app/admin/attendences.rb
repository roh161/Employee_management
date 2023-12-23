ActiveAdmin.register Attendence do

  permit_params :staff_id, :date, :status
  
  controller do
    def scoped_collection
      if current_admin_user.staff?
        Attendence.where(staff_id: current_admin_user.id)
      else
        Attendence.all
      end
    end
  end

  index do
    selectable_column
    id_column
    
    if current_admin_user.admin_user?
      column :staff_id do |staff|
        staff_email = AdminUser.find_by(id: staff.staff_id)
        staff_email.email
      end
    end

    column :date
    column :status
    
    actions
      
  end

  show do
    attributes_table do
      row :staff_id if current_admin_user.admin_user?
      row :date
      row :status
    end
  end

  form do |f|
     f.inputs 'Attendences Details' do
      f.input :staff_id, as: :select, collection: AdminUser.where(role: :staff).pluck(:email, :id)
      f.input :date
      f.input :status, as: :select, collection: Attendence.statuses.values
     
    end
    f.actions
  end
  
  filter :staff_id,as: :select,collection: proc { AdminUser.all.map { |user| [user.email, user.id] } }, if: proc { current_admin_user&.admin_user? }
  filter :date
  filter :status, as: :select, collection: Attendence.statuses.values
end
