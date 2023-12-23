class PermissionMailer < ApplicationMailer
    def permission_notification(permission)
      @permission = permission
      emails = AdminUser.where(role: permission.role).pluck(:email)
      mail(to: emails, subject: 'Permission Notification')
    end
end
  