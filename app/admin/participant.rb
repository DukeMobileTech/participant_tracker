ActiveAdmin.register Participant do
  menu priority: 4
  permit_params :uuid, :participant_type_id
  sidebar 'Associations', only: :show do
    ul do
      li link_to 'Participant Properties', admin_participant_participant_properties_path(resource)
    end
  end

  index do
    selectable_column
    column :id
    column :created_at
    column :updated_at
    column :uuid
    column :device_label
    column 'Participant Type' do |participant|
      participant.participant_type.label
    end
    column 'Participant Label', &:properties_label
    actions
  end

  form do |f|
    f.inputs 'Participant Details' do
      f.input :uuid
      f.input :participant_type, collection: ParticipantType.all.collect { |p| [p.label, p.id] }
    end
    f.actions
  end
end
