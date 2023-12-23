class SalaryMailer < ApplicationMailer
    def send_salary_email(user, salary)
      @user = user
      @salary = salary
      @pdf_file_path = SalarySlipPdfGenerator.generate(salary)
  
      attachments["salary_slip.pdf"] = File.read(@pdf_file_path)
  
      mail(to: @user.email, subject: 'Salary Credited')
     # ensure
     #   File.delete(@pdf_file_path) if File.exist?(@pdf_file_path)
    end
end