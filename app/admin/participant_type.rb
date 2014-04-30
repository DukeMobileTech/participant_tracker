ActiveAdmin.register ParticipantType do
  menu priority: 6
  permit_params :label, :label_property
  
  form do |f|
    f.inputs "Participant Type Details" do
      f.input :label
      f.input :property, collection: Property.all.collect {|p| [p.label, p.id]} 
    end
    f.actions
  end
  
end
