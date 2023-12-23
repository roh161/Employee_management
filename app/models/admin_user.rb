class AdminUser < ApplicationRecord
  role_based_authorizable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  belongs_to :department, optional: true
  has_many :educations, class_name: 'Education', foreign_key: 'staff_id', dependent: :destroy
  has_many :experiences, class_name: 'Experience', foreign_key: 'staff_id', dependent: :destroy
  has_many :leaves, class_name: 'Leave', foreign_key: 'staff_id', dependent: :destroy
  has_many :attendences, class_name: 'Attendence', foreign_key: 'staff_id', dependent: :destroy
  has_many :salaries, class_name: 'Salary', foreign_key: 'staff_id', dependent: :destroy

  accepts_nested_attributes_for :educations, allow_destroy: true
  accepts_nested_attributes_for :experiences, allow_destroy: true

  def staff?
    role == 'staff'
  end
  
  def admin_user?
    role == 'admin_user'
  end

  has_one_attached :profile_image
end
