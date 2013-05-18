# -*- encoding: utf-8 -*-

module HappyPhoneNumber

  # Internal: A simple facade which call the real formatter.
  class Formatter

    # Internal: Initialize the formatter facade.
    #
    # phone           - A String phone number to format.
    # type            - :national | :international | :mask.
    # country_or_mask - The country as Symbol or String in
    #                   ISO 3166-1-alpha-2, or a String mask.
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
      if @type == :mask
        use_mask
      else
        use_formatter
      end
    end

    private

    # Format phone using a mask.
    #
    # Returns the String formatted phone number.
    def use_mask
      Mask.new(@phone, @country_or_mask).format
    end

    # Format phone using a country formatter.
    #
    # Returns the String formatted phone number.
    def use_formatter
      begin
        require "happy_phone_number/#{formatter_filename}"
        HappyPhoneNumber.const_get(formatter_classname).new(
          @phone, @type, @separator).format
      rescue LoadError
        return @phone
      end
    end

    # Get the formatter classname.
    #
    # Examples
    #
    #   @country_or_mask = :fr
    #   formatter_classname # => "FrFormat"
    #
    # Returns the String formatter classname.
    def formatter_classname
      "#{@country_or_mask.to_s.capitalize}Format"
    end

    # Get the formatter filename.
    #
    # Examples
    #
    #   @country_or_mask = :fr
    #   formatter_classname # => "fr_format"
    #
    # Returns the String formatter filename.
    def formatter_filename
      "#{@country_or_mask.to_s.downcase}_format"
    end
  end
end

