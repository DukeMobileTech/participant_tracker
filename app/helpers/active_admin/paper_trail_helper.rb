module ActiveAdmin::PaperTrailHelper
  def perpetrator(str)
    return nil if str.blank?
    klass_name, object_id = str.split(':')
    eval(klass_name).find(object_id)
  end
end
