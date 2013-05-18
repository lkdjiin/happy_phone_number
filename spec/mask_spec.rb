# -*- encoding: utf-8 -*-

require 'spec_helper'

describe "mask formatting" do
  before { @contact = Contact.new(phone: "0123456789") }

  specify { @contact.happy_mask_phone("#### ### ###").should == "0123 456 789" }
  specify do
    @contact.happy_mask_phone("##-##-###-###").should == "01-23-456-789"
  end
  specify { @contact.happy_mask_phone("#####.#####").should == "01234.56789" }
  specify { @contact.happy_mask_phone("#### ###-###").should == "0123 456-789" }

  describe "with a mask too long" do
    specify do
      @contact.happy_mask_phone("#### ### ####").should == "0123 456 789"
    end
  end

  describe "with a mask too short" do
    specify { @contact.happy_mask_phone("##").should == "0123456789" }
  end

end

