# -*- encoding: utf-8 -*-

module HappyPhoneNumber
  class FrFormat < BaseFormat

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

