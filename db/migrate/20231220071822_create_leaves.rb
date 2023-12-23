class CreateLeaves < ActiveRecord::Migration[6.1]
  def change
    create_table :leaves do |t|
      t.integer :staff_id, null: false
      t.date :start_date
      t.date :end_date
      t.string :leave_type
      t.text :reason
      t.boolean :status

      t.timestamps
    end
  end
end
