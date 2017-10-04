ActiveAdmin.register ParticipantProperty do
  belongs_to :participant
  permit_params :uuid, :participant_uuid, :property_id, :value
  sidebar :versionate, partial: 'layouts/version', only: :show

  member_action :history do
    @participant_property = ParticipantProperty.find(params[:id])
    @versions = PaperTrail::Version.where(item_type: 'ParticipantProperty', item_id: @participant_property.id)
    render 'layouts/history'
  end

  action_item :history, only: :show do
    link_to 'Participant Property History', history_admin_participant_participant_property_path(participant.id, params[:id])
  end

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

  controller do
    def show
      @participant_property = ParticipantProperty.includes(versions: :item).find(params[:id])
      @versions = @participant_property.versions
      @participant_property = @participant_property.versions[params[:version].to_i].reify if params[:version]
      show! # it seems to need this
     end
  end
end
