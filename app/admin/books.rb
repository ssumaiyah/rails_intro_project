ActiveAdmin.register Book do

  filter :cover_image_attachment_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :author_id, :genre_id, :bookstore_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :author_id, :genre_id, :bookstore_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
