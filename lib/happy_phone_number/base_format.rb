# -*- encoding: utf-8 -*-

module HappyPhoneNumber
  class BaseFormat

    def initialize phone, type, separator
      @phone = phone
      @type = type
      @separator = separator
    end

    private

      def make_happy groups
        unpack_string = "A#{groups.split('').join('A')}"
        @phone.unpack(unpack_string).join(@separator)
      end

      def internationalize_with prefix
        @phone = "+#{prefix}#{@phone[1, @phone.length - 1]}"
      end
  end
end

