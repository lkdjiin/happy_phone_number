# -*- encoding: utf-8 -*-

require 'spec_helper'

describe "mask formatting" do
  before { @contact = Contact.new(phone: "0123456789") }

  specify { @contact.happy_phone("#### ### ###").should == "0123 456 789" }
  specify { @contact.happy_phone("##-##-###-###").should == "01-23-456-789" }
  specify { @contact.happy_phone("#####.#####").should == "01234.56789" }
  specify { @contact.happy_phone("#### ###-###").should == "0123 456-789" }

  describe "with a mask too long" do
    specify { @contact.happy_phone("#### ### ####").should == "0123 456 789" }
  end

  describe "with a mask too short" do
    specify { @contact.happy_phone("##").should == "0123456789" }
  end

end

