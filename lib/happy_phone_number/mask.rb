# -*- encoding: utf-8 -*-

module HappyPhoneNumber

  # Internal: Phone number formatting using a mask.
  #
  # Examples
  #
  #   Mask.new("123456", "### ###").format
  #   # => "123 456"
  #
  #   Mask.new("123456", "## ##-##").format
  #   # => "12 34-56"
  #
  #   Mask.new("123456", "##.####").format
  #   # => "12.3456"
  class Mask

    # Internal: Initialize a new mask formatter.
    #
    # phone - A String phone number.
    # mask  - A String mask.
    def initialize phone, mask
      @phone = phone
      @mask = mask
    end

    # Internal: Format the phone number. If the mask is too long for the
    # phone number, it will be truncated (the mask). If the mask is too
    # short, the returned phone number will be left untouched.
    #
    # Examples
    #
    #   Mask.new("1234", "### ###").format
    #   # => "123 4"
    #
    #   Mask.new("1234", "#").format
    #   # => "1234"
    #
    # Returns the String formatted phone number.
    def format
      return @phone if mask_too_short?
      mask_array.map do |item|
        if item == "#"
          next_digit
        else
          item
        end
      end.join
    end

    private

    # Check if the mask is too short for the phone number.
    #
    # Returns true or false.
    def mask_too_short?
      @mask.split('').select {|i| i == "#" }.size < @phone.size
    end

    # Split the mask into single characters.
    #
    # Returns an Array.
    def mask_array
      @mask.split('')
    end

    # Get the next digit of the phone number.
    #
    # Examples
    #
    #   @phone = "123"
    #   next_digit
    #   # => "1"
    #   next_digit
    #   # => "2"
    #
    # Returns a String.
    def next_digit
      @phone.slice!(0)
    end

  end
end

