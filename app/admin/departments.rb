ActiveAdmin.register Department do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :department_name
   
  index do
    selectable_column
    id_column
    column :department_name
    
    actions
  end

  show do
    attributes_table do
      row :department_name
      
    end
  end

  form do |f|
     f.inputs 'Department Details' do
      f.input :department_name, as: :select, collection: Department.department_names.values
      

    end
    f.actions
  end
  
end
