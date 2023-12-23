ActiveAdmin.register Salary do

  permit_params :staff_id, :date, :payment_method, :amount, :status

  action_item :send_salary_email, only: :show do
    link_to 'Send Salary Email', send_salary_email_admin_salary_path(salary), method: :put
  end

  member_action :send_salary_email, method: :put do
    
    @salary = resource
    @user = @salary.staff 

    SalaryMailer.send_salary_email(@user, @salary).deliver_now

    redirect_to admin_salary_path(@salary), notice: 'Salary email sent!'
  end
  
  controller do
    def scoped_collection
      if current_admin_user.staff?
        Salary.where(staff_id: current_admin_user.id)
      else
        Salary.all
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
    column :payment_method
    column :amount
    column :status
    
    actions 
      
  end

  show do
    attributes_table do
      row :staff_id if current_admin_user.admin_user?
      row :date
      row :payment_method
      row :amount
      row :status
    end
  end

  form do |f|
     f.inputs 'Salaries Details' do
      f.input :staff_id, as: :select, collection: AdminUser.where(role: :staff).pluck(:email, :id)
      f.input :date
      f.input :payment_method, as: :select, collection: Salary.payment_methods.values
      f.input :amount
      f.input :status, as: :select, collection: Salary.statuses.values
    end
    f.actions
  end

  filter :staff_id,as: :select,collection: proc { AdminUser.all.map { |user| [user.email, user.id] } }, if: proc { current_admin_user&.admin_user? }
  filter :date
  filter :payment_method, as: :select, collection: Salary.payment_methods.values
  filter :amount
  filter :status, as: :select, collection: Salary.statuses.values
  
end


