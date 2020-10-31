ActiveAdmin.register Task do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :external_id, :document_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:external_id, :document_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs :external_id        # builds an input field for every attribute
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

end
