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

    def happy_format(format, meth, *args)
      if format == :national
        happy_format_national(meth, *args)
      else
        happy_format_international(meth, *args)
      end
    end

    def happy_format_national(meth, *args)
      type = args[0]
      separator = args[1] || ' '
      if (type == :fr) || (type == :FR)
        send(meth.to_sym).unpack('A2A2A2A2A2').join(separator)
      elsif (type == :be) || (type == :BE)
        number_as_string = send(meth.to_sym)
        case number_as_string[0, 2]
        when "02", "03", "04", "08", "09"
          number_as_string.unpack('A2A3A2A2').join(separator)
        else
          number_as_string.unpack('A3A2A2A2').join(separator)
        end
      else
        send(meth.to_sym)
      end
    end

    def happy_format_international(meth, *args)
      type = args[0]
      separator = args[1] || ' '
      if (type == :fr) || (type == :FR)
        "+33#{send(meth.to_sym)[1, 9]}".unpack('A3A1A2A2A2A2').join(separator)
      elsif (type == :be) || (type == :BE)
        number_as_string = send(meth.to_sym)
        case number_as_string[0, 2]
        when "02", "03", "04", "08", "09"
          number_as_string.unpack('A2A3A2A2').join(separator)
          "+32#{number_as_string[1, 8]}".unpack('A3A1A3A2A2').join(separator)
        else
          "+32#{number_as_string[1, 8]}".unpack('A3A2A2A2A2').join(separator)
        end
      else
        send(meth.to_sym)
      end
    end

end

ActiveRecord::Base.send :include, HappyPhoneNumber
