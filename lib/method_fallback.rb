require 'method_fallback/version'

# Main module
#
# @since 0.1.0
module MethodFallback
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # Define fallbacks
    #
    # @param attribute_names [Array<String, Symbol>]
    # @param to: [String, Symbol]
    # @param aliased_attribtutes [Hash{String, Symbol => String, Symbol}]
    #
    # @since 0.1.0
    #
    # @example
    #   class Author
    #     def name
    #       'Jane Doe'
    #     end
    #   end
    #
    #   class Article
    #     include MethodFallback
    #
    #     def author
    #       Author.new
    #     end
    #
    #     def author_name
    #       nil
    #     end
    #
    #     fallback author_name: :name, to: :author
    #   end
    def fallback(*attribute_names, to:, **aliased_attributes)
      aliased_attributes = attribute_names
        .reduce({}) do |memo, attribute_name|
          memo[attribute_name] = attribute_name; memo
        end
        .merge!(aliased_attributes)

      aliased_attributes.keys.each do |name|
        alias_method "#{name}_without_fallback", name
      end

      mod = Module.new do
        aliased_attributes.each do |name, aka|
          define_method(name) do |*args, &block|
            value = super(*args, &block)

            if value.nil?
              send(to)&.send(aka, *args, &block)
            else
              value
            end
          end
        end
      end

      prepend mod
    end
  end
end
