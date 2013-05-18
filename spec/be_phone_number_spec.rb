# -*- encoding: utf-8 -*-

require 'spec_helper'

describe "format phone number form Belgium" do
  before { @contact = Contact.new(phone: "031112233", phone2: "063112233") }

  describe "with :be as 1st arg" do# {{{
    specify { @contact.happy_phone(:be).should == "03 111 22 33" }
    specify { @contact.happy_phone2(:be).should == "063 11 22 33" }

    describe "with '.' as second arg" do
      specify { @contact.happy_phone(:be, '.').should == "03.111.22.33" }
      specify { @contact.happy_phone2(:be, '.').should == "063.11.22.33" }
    end

    context "when region is Brussels" do
      before { @contact.phone = "021112233" }
      specify { @contact.happy_phone(:be).should == "02 111 22 33" }
    end

    context "when region is Ghent" do
      before { @contact.phone = "091112233" }
      specify { @contact.happy_phone(:be).should == "09 111 22 33" }
    end

    context "when region is Liege" do
      before { @contact.phone = "041112233" }
      specify { @contact.happy_phone(:be).should == "04 111 22 33" }
    end

    context "when region is Stavelot" do
      before { @contact.phone = "081112233" }
      specify { @contact.happy_phone(:be).should == "08 111 22 33" }
    end

  end# }}}

  describe "with :BE as 1st arg" do# {{{
    specify { @contact.happy_phone(:BE).should == "03 111 22 33" }
    specify { @contact.happy_phone2(:BE).should == "063 11 22 33" }

    describe "with '.' as second arg" do
      specify { @contact.happy_phone(:BE, '.').should == "03.111.22.33" }
      specify { @contact.happy_phone2(:BE, '.').should == "063.11.22.33" }
    end
  end# }}}

  describe "#happy_inter_*" do# {{{
    specify { @contact.happy_inter_phone(:be).should == "+32 3 111 22 33" }
    specify { @contact.happy_inter_phone2(:be).should == "+32 63 11 22 33" }

    describe "with '.' as second arg" do
      specify do
        @contact.happy_inter_phone(:be, '.').should == "+32.3.111.22.33"
      end
      specify do
        @contact.happy_inter_phone2(:be, '.').should == "+32.63.11.22.33"
      end
    end
  end# }}}

end

