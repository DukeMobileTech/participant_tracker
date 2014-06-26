ActiveAdmin.register Relationship do
  menu priority: 9
  permit_params :uuid, :relationship_type_id, :participant_owner_uuid, :participant_related_uuid
  
  form do |f|
    f.inputs "Relationship Details" do
      f.input :uuid
      f.input :relationship_type_id
      f.input :participant_owner_uuid
      f.input :participant_related_uuid
    end
    f.actions
  end
  
end