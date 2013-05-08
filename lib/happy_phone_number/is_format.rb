# -*- encoding: utf-8 -*-

module HappyPhoneNumber

  # Format phone numbers from Iceland.
  class IsFormat < BaseFormat

    # Format the phone number given convention for Iceland.
    #
    # Returns the String formatted phone number.
    def format
      if @type == :national
        make_happy '34'
      else
        internationalize_with '354'
        make_happy '434'
      end
    end
  end
end

