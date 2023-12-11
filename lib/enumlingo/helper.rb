module Enumlingo
  def enumlingo(*attributes)
    attributes.each do |attribute|
      define_method "#{attribute}_lingo" do
        value = send(attribute)
        # return nil if value.nil?
        I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{attribute.to_s.pluralize}.#{value}")
      end
    end
  end
end
