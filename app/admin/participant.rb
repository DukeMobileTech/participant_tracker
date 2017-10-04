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

  sidebar :versionate, partial: 'layouts/version', only: :show

  member_action :history do
    @participant = Participant.find(params[:id])
    @versions = PaperTrail::Version.where(item_type: 'Participant', item_id: @participant.id)
    render 'layouts/history'
  end

  action_item :history, only: :show do
    link_to 'Participant History', history_admin_participant_path(params[:id])
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

  controller do
    def show
      @participant = Participant.includes(versions: :item).find(params[:id])
      @versions = @participant.versions
      @participant = @participant.versions[params[:version].to_i].reify if params[:version]
      show! # it seems to need this
     end
  end
end
