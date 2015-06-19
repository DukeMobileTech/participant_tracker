ActiveAdmin.register ParticipantProperty do
  menu priority: 5
  permit_params :uuid, :participant_uuid, :property_id, :value

  form do |f|
    f.inputs "Participant Property Details" do
      f.input :uuid
      f.input :participant, collection: Participant.all.collect {|p| [p.uuid, p.uuid]} 
      f.input :property, collection: Property.all.collect {|p| [p.label, p.id]}
      f.input :value
    end
    f.actions
  end
  
end
