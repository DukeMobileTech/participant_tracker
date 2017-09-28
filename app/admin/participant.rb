ActiveAdmin.register Participant do
  permit_params :uuid, :participant_type_id, :active, :validation_id

  scope :all
  ParticipantType.all.each do |pt|
    scope pt.pretty_label.to_sym
  end

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
    column 'Type' do |participant|
      participant.participant_type.label
    end
    column 'Label', &:properties_label
    column :active
    column :validator_value
    actions
  end

  show do
    attributes_table do
      row :id
      row :created_at
      row :updated_at
      row :uuid
      row :device_label
      row :device_uuid
      row 'Type' do |participant|
        participant.participant_type.label
      end
      row 'Label', &:properties_label
      row :active
      row :validator_value
    end
  end

  form do |f|
    f.inputs 'Participant Details' do
      f.input :uuid
      f.input :participant_type, collection: ParticipantType.all.collect { |p| [p.label, p.id] }
      f.input :active
    end
    f.actions
  end
end
