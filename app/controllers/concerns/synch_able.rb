module SynchAble
  extend ActiveSupport::Concern

  def changed_models(association, timestamp)
    cache_key = association.with_deleted.maximum(:updated_at)
    last_touch = timestamp.blank? ? nil : Time.at(timestamp.to_i/1000).utc
    if last_touch.nil?
      Rails.cache.fetch("#{association.model_name.name}_#{cache_key.try(:to_i)}") do
        association.with_deleted
      end
    elsif last_touch > cache_key
      association.none
    else
      association.with_deleted.where('updated_at >= ?', last_touch)
    end
  end

end