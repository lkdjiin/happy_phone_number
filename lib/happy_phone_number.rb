require 'happy_phone_number/formatter'
require 'happy_phone_number/mask'
require 'happy_phone_number/base_format'

# Public: Happy Phone Number provides easy methods to format phone
# numbers from your Rails models. Virtually any country specific
# format could be supported, including national and international
# format. For the not (yet) supported countries, a general method
# using a simple mask is also provided.
#
# Examples
#
#   class Contact < ActiveRecord::Base
#     attr_accessible :email, :name, :phone, :fax
#     happy_phone_number
#   end
#
#   <%= @contact.happy_phone(:fr) %>
#   # => "01 23 45 67 89"
#
#   <%= @contact.happy_phone('fr') %>
#   # => "01 23 45 67 89"
#
#   <%= @contact.happy_inter_phone(:fr) %>
#   # => "+33 1 23 45 67 89"
#
#   <%= @contact.happy_phone(:be) %>
#   # => "03 111 22 33"
#
#   <%= @contact.happy_mask_phone("#### ###-###") %>
#   # => "0123 456-789"
module HappyPhoneNumber
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def happy_phone_number(options = {})
    end
  end

  # Public: Format a phone number from a model.
  #
  # args[0] - Either a Symbol|String country or a String formatting mask.
  #           A country must be in ISO 3166-1-alpha-2 format,
  #           both lower and upper case are valids.
  # block   - Not used.
  #
  # Signature
  #
  #   happy_<field>(country, separator)
  #   happy_inter_<field>(country, separator)
  #   happy_mask_<field>(mask)
  #
  # field     - A field name of the model that holds a phone number as a
  #             string.
  # country   - Symbol or String in ISO 3166-1-alpha-2 format.
  # separator - A String used to separate groups of number.
  # mask      - A String formatting mask.
  #
  # Returns the String formatted phone number.
  def method_missing(meth, *args, &block)
    if meth.to_s =~ /^happy_inter_(.+)$/
      happy_format(:international, $1, *args)
    elsif meth.to_s =~ /^happy_mask_(.+)$/
      happy_format(:mask, $1, *args)
    elsif meth.to_s =~ /^happy_(.+)$/
      happy_format(:national, $1, *args)
    else
      super
    end
  end

  # Public: Make the happy_* methods respond to respond_to?.
  def respond_to?(meth, include_private = false)
    if meth.to_s =~ /^happy_.*$/
      true
    else
      super
    end
  end

  private

  # Launch the formatting process.
  #
  # type - Either :national, :international or :mask.
  # meth - The String field from the model.
  # args - Argument(s) passed to the formatting method, like a country,
  #        a mask string, the separator.
  #
  # Returns the String formatted phone number.
  def happy_format(type, meth, *args)
    Formatter.new(send(meth.to_sym), type, args[0], args[1]).format
  end

end

ActiveRecord::Base.send :include, HappyPhoneNumber
