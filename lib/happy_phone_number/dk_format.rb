# -*- encoding: utf-8 -*-

module HappyPhoneNumber

  # Format phone numbers from Denmark.
  class DkFormat < BaseFormat

    # Format the phone number given danish convention.
    #
    # Returns the String formatted phone number.
    def format
      if @type == :national
        make_happy '2222'
      else
        internationalize_with '45'
        make_happy '32222'
      end
    end
  end
end

