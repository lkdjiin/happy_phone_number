# -*- encoding: utf-8 -*-

module HappyPhoneNumber

  # Internal: A simple facade which call the real formatter.
  class Formatter

    # Internal: Initialize the formatter facade.
    #
    # phone           - A String phone number to format.
    # type            - Either :national or :international.
    # country_or_mask - If it's a country, must be a two-letters Symbol.
    #                   If it's a String, it is considered as a mask.
    # separator       - Optional, a String to separate groups of digits
    #                   the final result.
    def initialize phone, type, country_or_mask, separator
      @phone = phone
      @type = type
      @country_or_mask = country_or_mask
      @separator = separator || ' '
    end

    # Internal: Call the real formatter.
    #
    # Returns the String formatted phone number.
    def format
      if @country_or_mask.class == String
        return Mask.new(@phone, @country_or_mask).format
      end
      # TODO Find a way to dynamically find the class of the country formatter.
      case @country_or_mask
      when :fr, :FR then FrFormat.new(@phone, @type, @separator).format
      when :be, :BE then BeFormat.new(@phone, @type, @separator).format
      else
        @phone
      end
    end

  end
end

