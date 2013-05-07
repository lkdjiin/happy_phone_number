# -*- encoding: utf-8 -*-

module HappyPhoneNumber

  # Format for belgian phone numbers.
  class BeFormat < BaseFormat

    # Format the phone number given belgian convention.
    #
    # Returns the String formatted phone number.
    def format
      case @phone[0, 2]
      when "02", "03", "04", "08", "09"
        if @type == :national
          make_happy '2322'
        else
          internationalize_with '32'
          make_happy '31322'
        end
      else
        if @type == :national
          make_happy '3222'
        else
          internationalize_with '32'
          make_happy '32222'
        end
      end
    end
  end
end

