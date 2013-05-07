# -*- encoding: utf-8 -*-

module HappyPhoneNumber

  # Format for french phone numbers.
  class FrFormat < BaseFormat

    # Format the phone number given french convention.
    #
    # Returns the String formatted phone number.
    def format
      if @type == :national
        make_happy '22222'
      else
        internationalize_with '33'
        make_happy '312222'
      end
    end
  end
end

