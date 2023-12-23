class CreateAttendences < ActiveRecord::Migration[6.1]
  def change
    create_table :attendences do |t|
      t.integer :staff_id
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
