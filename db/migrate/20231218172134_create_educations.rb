class CreateEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :educations do |t|
      t.integer :staff_id, null: false
      t.string :level, null: false 
      t.string :institution_name, null: false
      t.string :qualification 
      t.integer :start_year
      t.integer :completed_year
      t.string :specialization
      t.timestamps
    end
  end
end
