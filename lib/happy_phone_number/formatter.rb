# -*- encoding: utf-8 -*-

module HappyPhoneNumber
  class Formatter

    def initialize phone, type, country_or_mask, separator
      @phone = phone
      @type = type
      @country_or_mask = country_or_mask
      @separator = separator || ' '
    end

    def format
      if @country_or_mask.class == String
        return Mask.new(@phone, @country_or_mask).format
      end
      case @country_or_mask
      when :fr, :FR then FrFormat.new(@phone, @type, @separator).format
      when :be, :BE then BeFormat.new(@phone, @type, @separator).format
      else
        @phone
      end
    end

  end
end

