ActiveAdmin.register NoticeBoard do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :subject, :content, :date
  #
  index do
    selectable_column
    id_column
    column :subject
    column :content
    column :date
    
    actions
  end

  show do
    attributes_table do
      row :subject
      row :content
      row :date
      
    end
  end

  form do |f|
    f.inputs 'Notice Board Details' do
      f.input :subject
      f.input :content
      f.input :date
    end
    f.actions
  end
  
  
end
