ActiveAdmin.register Property do
  permit_params :label, :type_of, :required, :participant_type_id

  form do |f|
    f.inputs 'Property Details' do
      f.input :label
      f.input :type_of, collection: Settings.property_types
      f.input :required
      f.input :participant_type, collection: ParticipantType.all.collect { |p| [p.label, p.id] }
    end
    f.actions
  end
end
