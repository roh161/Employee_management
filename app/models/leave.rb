class Leave < ApplicationRecord
    belongs_to :staff, class_name: 'AdminUser', foreign_key: 'staff_id'
  
    enum leave_type: {
      Half_day: 'Half day',
      Full_day: 'Full day'
    }
  
    validates :staff_id, presence: true
    validates :start_date, :end_date, presence: true
    validates :leave_type, :reason, presence: true
    
    validate :end_date_after_start_date
  
    private
  
    def end_date_after_start_date
      return if end_date.blank? || start_date.blank?
  
      errors.add(:end_date, 'must be greater than or equal to start date') if end_date < start_date
    end
  end
