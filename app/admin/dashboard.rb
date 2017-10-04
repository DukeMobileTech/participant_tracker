ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    section 'Recent Participants' do
      table_for Participant.order('created_at desc').limit(10) do
        column :id do |participant|
          link_to participant.id, [:admin, participant]
        end
        column :uuid
        column 'Participant Type', :participant_type_id do |participant|
          link_to participant.participant_type.label, [:admin, participant.participant_type]
        end
        column :created_at
        column :updated_at
      end
    end

    section 'Recently Updated Content' do
      table_for PaperTrail::Version.order('id desc').limit(20) do
        column ('Item') do |v|
          v.item.class.name == 'ParticipantProperty' ?
          link_to(v.item, [:admin, v.item.participant, v.item]) : link_to(v.item, [:admin, v.item])
        end
        column ('Type') { |v| v.item_type.underscore.humanize }
        column ('Modified at') { |v| v.created_at.to_s :long }
        column ('User') { |v| link_to perpetrator(v.whodunnit).email, [:admin, perpetrator(v.whodunnit)] if perpetrator(v.whodunnit) }
      end
    end
  end
end
