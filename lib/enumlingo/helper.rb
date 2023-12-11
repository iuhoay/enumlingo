module Enumlingo
  def enumlingo(*attributes)
    attributes.each do |attribute|
      pluralized_attribute = attribute.to_s.pluralize

      define_method "#{attribute}_lingo" do
        value = send(attribute)
        # return nil if value.nil?
        I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{pluralized_attribute}.#{value}")
      end

      define_singleton_method "#{attribute.to_s.pluralize}_lingo" do
        send(attribute.to_s.pluralize).map do |key, value|
          [I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{pluralized_attribute}.#{key}"), key]
        end
      end
    end
  end
end
