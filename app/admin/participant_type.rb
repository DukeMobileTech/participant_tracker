ActiveAdmin.register ParticipantType do
  menu priority: 6
  permit_params :label
  
  form do |f|
    f.inputs "Participant Type Details" do
      f.input :label
    end
    f.actions
  end
  
end
