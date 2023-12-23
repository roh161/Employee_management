class CreateSalaries < ActiveRecord::Migration[6.1]
  def change
    create_table :salaries do |t|
      t.integer :staff_id
      t.date :date
      t.string :payment_method
      t.float :amount
      t.string :status

      t.timestamps
    end
  end
end
