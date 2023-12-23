class Salary < ApplicationRecord
    belongs_to :staff, class_name: 'AdminUser', foreign_key: 'staff_id'

    enum status: {
    Pending: 'Pending',
    Paid: 'Paid'
    }

    enum payment_method: {
    Cash: 'Cash',
    Online: 'Online'
    }

    validates :staff_id, presence:true
    validates :date, :payment_method, presence:true
    validates :amount, :status, presence:true
end
