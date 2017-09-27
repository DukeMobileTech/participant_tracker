ActiveAdmin.register ParticipantType do
  permit_params :label

  sidebar 'Associations', only: :show do
    ul do
      li link_to 'Participants', admin_participant_type_participants_path(resource)
    end
  end

  form do |f|
    f.inputs 'Participant Type Details' do
      f.input :label
    end
    f.actions
  end
end
