class UpdateLeaveStatusDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :leaves, :status, false
  end
end
