ActiveAdmin.register ParticipantProperty do
  belongs_to :participant
  permit_params :uuid, :participant_uuid, :property_id, :value

  index do
    selectable_column
    column :id
    column :created_at
    column :updated_at
    column :uuid
    column :participant_uuid
    column :value
    column 'Property' do |participant_property|
      participant_property.property.label
    end
    actions
  end

  form do |f|
    f.inputs 'Participant Property Details' do
      f.input :uuid
      f.input :participant, collection: Participant.all.collect { |p| [p.uuid, p.uuid] }
      f.input :property, collection: Property.all.collect { |p| [p.label, p.id] }
      f.input :value
    end
    f.actions
  end
end
