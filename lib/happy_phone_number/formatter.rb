# -*- encoding: utf-8 -*-

module HappyPhoneNumber
  class Formatter

    def initialize phone, type, country, separator
      @phone = phone
      @type = type
      @country = country
      @separator = separator || ' '
    end

    def format
      case @country
      when :fr, :FR then FrFormat.new(@phone, @type, @separator).format
      when :be, :BE then BeFormat.new(@phone, @type, @separator).format
      else
        @phone
      end
    end

  end
end

