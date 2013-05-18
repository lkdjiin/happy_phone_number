# -*- encoding: utf-8 -*-

require 'spec_helper'

describe HappyPhoneNumber do

  describe "#respond_to?" do
    before { @contact = Contact.new(phone: "0123456789", phone2: "1111111111") }
    specify { @contact.should respond_to(:happy_phone) }
    specify { @contact.should respond_to(:happy_inter_phone) }
    specify { @contact.should respond_to(:happy_phone2) }
    specify { @contact.should respond_to(:happy_inter_phone2) }
  end

end
