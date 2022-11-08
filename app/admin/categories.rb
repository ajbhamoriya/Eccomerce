ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name,:image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :name
    column :image do|category|
      if category.image.present?
        image_tag category.image,width:'75',height:'75'
      end
    end
    column :created_at
    actions
  end

  form do |f|
     f.inputs "category" do
        f.input :name
        f.input :image, as: :file
        f.actions
      end
  end
end


  