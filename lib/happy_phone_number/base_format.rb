# -*- encoding: utf-8 -*-

module HappyPhoneNumber

  # Internal: Base class for specific country formatter.
  class BaseFormat

    # Internal: Initialize a new base formatter.
    #
    # phone     - A String phone number to format.
    # type      - Either :national or :international.
    # separator - A String separator to put into each groups of digit.
    def initialize phone, type, separator
      @phone = phone
      @type = type
      @separator = separator
    end

    private

    # Internal: Format the phone number using specified grouping.
    #
    # groups - A String set of digits.
    #
    # Examples
    #
    #   @phone = "123456"
    #   make_happy "222"
    #   # => "12 34 56"
    #
    #   @phone = "+33123456789"
    #   @separator = "."
    #   make_happy "312222"
    #   # => "+33.1.23.45.67.89"
    #
    # Returns the String formatted phone number.
    def make_happy groups
      unpack_string = "A#{groups.split('').join('A')}"
      @phone.unpack(unpack_string).join(@separator)
    end

    # Internal: Internationalize a phone number with a given prefix.
    #
    # prefix - A String.
    # block  - Optional, a block to call before we add the prefix.
    #
    # Examples
    #
    #   puts @phone
    #   # => "12345678"
    #   internationalize_with("45")
    #   # => "+4512345678"
    #
    #   puts @phone
    #   # => "0123456789"
    #   internationalize_with("33") { @phone.slice!(0) }
    #   # => "+33123456789"
    #
    # Returns nothing.
    def internationalize_with prefix, &block
      block.call if block
      @phone = "+#{prefix}#{@phone}"
    end

  end
end

