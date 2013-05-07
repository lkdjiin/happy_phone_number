# -*- encoding: utf-8 -*-

module HappyPhoneNumber
  class Mask

    def initialize phone, mask
      @phone = phone
      @mask = mask
    end

    def format
      return @phone if mask_too_short?
      mask_array.map do |item|
        if item == "#"
          next_number
        else
          item
        end
      end.join
    end

    private

      def mask_too_short?
        @mask.split('').select {|i| i == "#" }.size < @phone.size
      end

      def mask_array
        @mask.split('')
      end

      def next_number
        @phone.slice!(0)
      end
  end
end

