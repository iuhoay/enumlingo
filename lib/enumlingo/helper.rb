module Enumlingo
  def enumlingo(*attributes)
    attributes.each do |attribute|
      pluralized_attribute = attribute.to_s.pluralize

      define_method "#{attribute}_lingo" do
        value = send(attribute)
        # return nil if value.nil?
        I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{pluralized_attribute}.#{value}")
      end

      define_singleton_method "#{pluralized_attribute}_lingo" do
        send(attribute.to_s.pluralize).map do |key, value|
          [I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{pluralized_attribute}.#{key}"), key]
        end
      end

      define_singleton_method "#{attribute}_lingo" do |key|
        I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{pluralized_attribute}.#{key}")
      end

      define_singleton_method "#{pluralized_attribute}_lingo_values" do |locale = I18n.locale|
        send(attribute.to_s.pluralize).map do |key, value|
          [I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{pluralized_attribute}.#{key}", locale: locale), value]
        end
      end
    end
  end
end
