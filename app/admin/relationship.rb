ActiveAdmin.register Relationship do
  belongs_to :relationship_type
  permit_params :uuid, :relationship_type_id, :participant_owner_uuid, :participant_related_uuid
  sidebar :versionate, partial: 'layouts/version', only: :show

  form do |f|
    f.inputs 'Relationship Details' do
      f.input :uuid
      f.input :relationship_type, collection: RelationshipType.all.collect { |p| [p.label, p.id] }
      f.input :participant_owner, collection: Participant.all.collect { |p| [p.uuid, p.uuid] }
      f.input :participant_related, collection: Participant.all.collect { |p| [p.uuid, p.uuid] }
    end
    f.actions
  end

  controller do
    def show
      @relationship = Relationship.includes(versions: :item).find(params[:id])
      @versions = @relationship.versions
      @relationship = @relationship.versions[params[:version].to_i].reify if params[:version]
      show! # it seems to need this
     end
  end
end
