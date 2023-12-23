class Attendence < ApplicationRecord
    belongs_to :staff, class_name: 'AdminUser', foreign_key: 'staff_id'

    enum status: {
    Present: 'Present',
    Absent: 'Absent',
    Half_day: 'Half_day'
    }

    validates :staff_id, :status, :date, presence:true

    
end
