module HappyPhoneNumber
  extend ActiveSupport::Concern

  included do

  end

  module ClassMethods
    def happy_phone_number(options = {})
      # your code will go here
    end
  end

  def method_missing(meth, *args, &block)
    if meth.to_s =~ /^happy_(.+)$/
      run_happy($1, *args, &block)
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

  def run_happy(meth, *args, &block)
    type = args[0]
    separator = args[1] || ' '
    if (type == :fr) || (type == :FR)
      send(meth.to_sym).unpack('A2A2A2A2A2').join(separator)
    elsif type == :international
      "+33#{send(meth.to_sym)[1, 9]}".unpack('A3A1A2A2A2A2').join(separator)
    else
      send(meth.to_sym)
    end
  end

end

ActiveRecord::Base.send :include, HappyPhoneNumber
