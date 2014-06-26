ActiveAdmin.register RelationshipType do
  menu priority: 8
  permit_params :label, :participant_type_owner_id, :participant_type_related_id
  
  form do |f|
    f.inputs "Relationship Type Details" do
      f.input :label
      f.input :participant_type_owner, collection: ParticipantType.all.collect {|p| [p.label, p.id]}
      f.input :participant_type_related, collection: ParticipantType.all.collect {|p| [p.label, p.id]}
    end
    f.actions
  end
  
end
