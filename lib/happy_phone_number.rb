require 'happy_phone_number/formatter'
require 'happy_phone_number/mask'
require 'happy_phone_number/base_format'
require 'happy_phone_number/be_format'
require 'happy_phone_number/fr_format'

module HappyPhoneNumber
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def happy_phone_number(options = {})
    end
  end

  def method_missing(meth, *args, &block)
    if meth.to_s =~ /^happy_inter_(.+)$/
      happy_format(:international, $1, *args)
    elsif meth.to_s =~ /^happy_(.+)$/
      happy_format(:national, $1, *args)
    else
      super
    end
  end

  def respond_to?(meth, include_private = false)
    if meth.to_s =~ /^happy_.*$/
      true
    else
      super
    end
  end

  private

    def happy_format(type, meth, *args)
      Formatter.new(send(meth.to_sym), type, args[0], args[1]).format
    end

end

ActiveRecord::Base.send :include, HappyPhoneNumber
