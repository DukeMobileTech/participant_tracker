ActiveAdmin.register RelationshipType do
  menu priority: 8
  permit_params :label, :participant_type_owner_id, :participant_type_related_id
  
  form do |f|
    f.inputs "Relationship Type Details" do
      f.input :label
      f.input :participant_type_owner_id
      f.input :participant_type_related_id
    end
    f.actions
  end
  
end
