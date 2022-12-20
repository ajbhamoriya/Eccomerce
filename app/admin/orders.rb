ActiveAdmin.register Order do

 
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :coupon_id, :discount, :total,:status
  #
  # or
  #
  #permit_params do
    #permitted = [:user_id, :coupon_id, :discount, :total]
    #permitted << :other if params[:action] == 'create' && current_user.admin?
    #permitted

  show do
    h1 order.user.first_name
    attributes_table do
      row :user
      row :total
      row :coupon_id
      row :discount
      row :status
      #columns do
        columns do
          panel 'order_items' do
            attributes_table_for order&.order_items do 
              row :name
              row :quantity
              row :price
              row :image do |order_items|
                image_tag order_items.product.image,width:'75',height:'75'

              end
            end
          end
        end
      #end
    end 
  end
  form do |f| 
    f.inputs do 
      #f.input :status, :as => :select, :collection => order.status.map{|m| [m.key, m.value]},:prompt   => "Select a status"
      f.input :status, :as => :select, :collection => ["confirmed","out_for_delivery","delivered","canceled"],:prompt => "select_status"
      f.input :payment_status, :as => :select, :collection => ["created","paymentcompleted","cancelled","refunded"],:prompt => "select_payment_status"
    end
    f.actions
  end
end
 