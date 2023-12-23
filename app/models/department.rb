class Department < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "department_name", "id", "updated_at"]
    end

    enum department_name: {
    Sales: 'Sales',
    Marketing: 'Marketing',
    Finance: 'Finance',
    Engineering: 'Engineering',
    HR: 'Human Resources',
    IT: 'Information Technology'

  }

  has_many :staffs, class_name: 'AdminUser', dependent: :destroy
    
  validates :department_name, presence:true
end
