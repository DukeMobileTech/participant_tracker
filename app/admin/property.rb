ActiveAdmin.register Property do
  menu priority: 7
  permit_params :label, :type_of, :required, :participant_type_id
  
  form do |f|
    f.inputs "Property Details" do
      f.input :label
      f.input :type_of
      f.input :required
      f.input :participant_type, collection: ParticipantType.all.collect {|p| [p.label, p.id]} 
    end
    f.actions
  end
  
end
