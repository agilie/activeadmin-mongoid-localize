module ActiveAdmin
  module Views
    class LocalizedAttributesTable < ActiveAdmin::Views::AttributesTable
      builder_method :localize_attributes_table_for

      def row(attr, &block)
        _locales = ActiveAdmin::Mongoid::Localize.locales
        _locales.each_with_index do |locale, index|
          @table << tr do
            if index == 0
              th :rowspan => _locales.length do
                header_content_for(attr)
              end
            end
            td do
              I18n.with_locale locale do
                (
                  image_tag("aml/flags/#{locale.to_s}.png", alt: locale.to_s, title: locale.to_s) +
                  ' ' +
                  content_for(@collection[0], block || attr)
                ).html_safe
              end
            end
          end
        end
      end

      protected

      def default_id_for_prefix
        'attributes_table'
      end

      def default_class_name
        'attributes_table'
      end

    end
  end
end
