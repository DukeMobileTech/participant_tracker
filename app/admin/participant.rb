ActiveAdmin.register Participant do
  menu priority: 4
  permit_params :uuid, :participant_type_id

  form do |f|
    f.inputs "Participant Details" do
      f.input :uuid
      f.input :participant_type, collection: ParticipantType.all.collect {|p| [p.label, p.id]} 
    end
    f.actions
  end
  
end
