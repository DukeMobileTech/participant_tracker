ActiveAdmin.register ParticipantType do
  permit_params :label

  form do |f|
    f.inputs 'Participant Type Details' do
      f.input :label
    end
    f.actions
  end
end
