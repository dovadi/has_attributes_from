module WithProperties
  module Core

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def with_properties table
        properties = table.to_s
        has_one table
        before_save :save_properties

        define_getters_and_setters(properties)
        define_save_properties(properties)
        override_create(properties)
      end

      private

      def define_save_properties(properties)
        class_eval %{
          def save_properties
            #{properties}.save if #{properties} && #{properties}.changed?
          end
        }
      end

      def define_getters_and_setters(properties)
        column_names = properties.camelize.constantize.column_names.reject {|column| column=~/^id$|_id|_at/}
        column_names.each do |column|
          class_eval %{
            def #{column}
              #{properties}.nil? ? '' : #{properties}.#{column}
            end
            def #{column}=(value)
              #{properties}.#{column}=value if #{properties}
            end
          }
        end
      end

      def override_create(properties)
        instance_eval %{
          def create(attributes = nil, &block)
            attributes.stringify_keys!
            attributes_without_associated = attributes.reject{|k,v| k if reflections[k.to_sym]}

            attribute_keys = attributes_without_associated.keys.map{|k| k.to_s}
            attributes_only_associated_keys = attributes.keys - attributes_without_associated.keys

            property_attribute_keys =  (attribute_keys -  column_names)
            parent_attribute_keys = attribute_keys - property_attribute_keys

            parent_attributes  = {}
            property_attributes ={}
            attributes.each do |k,v|
              parent_attributes[k]=v if parent_attribute_keys.include?(k) || attributes_only_associated_keys.include?(k)
              property_attributes[k]=v if property_attribute_keys.include?(k)
            end
            instance_of_property_model = "#{properties}".camelize.constantize.new(property_attributes)

            attributes = parent_attributes.merge(:#{properties}=>instance_of_property_model)

            super
          end
        }
      end

    end

  end
end