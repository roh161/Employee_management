class AddDepartmentIdToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :department_id, :integer
  end
end
