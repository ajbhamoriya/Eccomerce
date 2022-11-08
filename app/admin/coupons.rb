ActiveAdmin.register Coupon do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :code, :discount, :min_cart_value, :discount_type
  #
  # or
  #
  # permit_params do
  #   permitted = [:code, :discount, :min_cart_value, :discount_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
     f.inputs "new coupon" do
        f.input :code
        f.input :discount
        f.input :min_cart_value
        f.input :discount_type, :as => :select, :collection => ["percentage","flat"],:prompt => "select discount type"
        f.actions
      end
  end
  index do
    selectable_column
    id_column
    column :code
    column :discount
    column :min_cart_value
    column :discount_type
    column :created_at
    actions
  end
end
  


#COUNTRIES = ["Democratic", "Republic"]
#= f.select :country, ModelName::COUNTRIES, { prompt: "Select Country" }
#<%= select_tag(:week_day, options_for_select([['Sunday', 'Sun'], ['Monday', 'Mon'], ...])) %> 