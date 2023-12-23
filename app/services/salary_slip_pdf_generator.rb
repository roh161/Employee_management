class SalarySlipPdfGenerator
    def self.generate(payslip_data)
      pdf = Prawn::Document.new
  
      employee_email = payslip_data.staff.email
      employee_department = payslip_data.staff.department.department_name
      
      basic_pay = payslip_data.amount
      incentive_pay = 2000
      house_rent_allowance = 5000
      meal_allowance = 2000
      net_pay = basic_pay + incentive_pay + house_rent_allowance + meal_allowance
  
      # Company Information
      pdf.text "XYZ IT Solution", size: 18, style: :bold
      pdf.text "21023 Pearson Point Road", size: 12
      pdf.text "Gate Avenue", size: 12
      pdf.move_down 10
  
      # Employee Information
      pdf.text "Employee Email: #{employee_email}", size: 12
      pdf.text "Department: #{employee_department}", size: 12
      pdf.move_down 10
  
      # Earnings
      pdf.text "Earnings", size: 14, style: :bold
      pdf.move_down 5
  
      # Earnings Table
      earnings_data = [
        ["Basic Pay", basic_pay],
        ["Incentive Pay", incentive_pay],
        ["House Rent Allowance", house_rent_allowance],
        ["Meal Allowance", meal_allowance],
      ]
  
      pdf.table(earnings_data, header: true, cell_style: { padding: 5 }) do |table|
        table.column(0).font_style = :bold
      end
  
      # Space between Earnings Table and Net Pay
      pdf.move_down 10
  
      # Net Pay
      pdf.text "Net Pay: #{net_pay}", size: 14, style: :bold
      pdf.move_down 10
  
      # Slip Month and Date
      pdf.text "Payslip for: #{payslip_data.date.strftime('%B %Y')}", size: 12
      pdf.text "Generated on: #{Time.now.strftime('%d %B %Y')}", size: 12
      pdf.move_down 10
  
      # Signatures
      pdf.text "Employer Signature", size: 12
      pdf.text "Employee Signature", size: 12
      pdf.move_down 10
  
      # Note
      pdf.text "This is a system-generated payslip", size: 10, color: "888888"
  
      # Save the PDF to a file
      pdf_file_path = Rails.root.join("tmp", "payslip_#{Time.now.to_i}.pdf")
      pdf.render_file(pdf_file_path)
  
      pdf_file_path
    end
  end