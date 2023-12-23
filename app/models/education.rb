class Education < ApplicationRecord
    belongs_to :staff, class_name: 'AdminUser', foreign_key: 'staff_id'
    
    validates :staff_id, presence:true
    validates :institution_name, :qualification, presence:true
    validates :specialization, :level,presence:true
end