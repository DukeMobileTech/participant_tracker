ActiveAdmin.register RelationshipType do
  permit_params :label, :participant_type_owner_id, :participant_type_related_id

  sidebar 'Associations', only: :show do
    ul do
      li link_to 'Relationships', admin_relationship_type_relationships_path(resource)
    end
  end

  form do |f|
    f.inputs 'Relationship Type Details' do
      f.input :label
      f.input :participant_type_owner, collection: ParticipantType.all.collect { |p| [p.label, p.id] }
      f.input :participant_type_related, collection: ParticipantType.all.collect { |p| [p.label, p.id] }
    end
    f.actions
  end
end
