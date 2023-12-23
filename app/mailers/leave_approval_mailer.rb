class LeaveApprovalMailer < ApplicationMailer
    def leave_approval(leave)
        
    
        @leave = leave
        
        # staff = AdminUser.where(id: leave.staff_id)
        mail(to: leave.staff.email, subject: 'Leave Approved')
       
    end
    
end
