# -*- encoding: utf-8 -*-

require 'spec_helper'

describe "format french phone number" do# {{{
  before { @contact = Contact.new(phone: "0123456789", phone2: "1111111111") }

  describe "#happy_*" do# {{{
    describe "with no args" do# {{{
      it "should return the phone number unformatted" do
        @contact.happy_phone.should == "0123456789"
      end
    end# }}}

    describe "with unknown locale" do# {{{
      it "should return the phone number unformatted" do
        @contact.happy_phone(:zz).should == "0123456789"
      end
    end# }}}

    describe "with :fr as 1st arg" do# {{{
      it "should format as a french phone number" do
        @contact.happy_phone(:fr).should == "01 23 45 67 89"
      end

      describe "with '.' as second arg" do
        it "should format with dot as separator" do
          @contact.happy_phone(:fr, '.').should == "01.23.45.67.89"
        end
      end
    end# }}}

    describe "with :FR as 1st arg" do# {{{
      it "should format as a french phone number" do
        @contact.happy_phone(:FR).should == "01 23 45 67 89"
      end
    end# }}}

  end# }}}

  describe "#happy_inter_*" do# {{{

    describe "with :fr as 1st arg" do
      specify do
        @contact.happy_inter_phone(:fr).should == "+33 1 23 45 67 89"
      end

      describe "with '.' as second arg" do
        it "should format with dot as separator" do
          @contact.happy_inter_phone(:fr, '.').should == "+33.1.23.45.67.89"
        end
      end

    end

    describe "with :FR as 1st arg" do
      specify do
        @contact.happy_inter_phone(:FR).should == "+33 1 23 45 67 89"
      end
    end

    describe "with unknown locale" do
      it "should return the phone number unformatted" do
        @contact.happy_inter_phone(:zz).should == "0123456789"
      end
    end
  end# }}}

  describe "#happy_phone2" do# {{{

    describe "with :fr as 1st arg" do
      it "should format as a french phone number" do
        @contact.happy_phone2(:fr).should == "11 11 11 11 11"
      end

      describe "with '.' as second arg" do
        it "should format with dot as separator" do
          @contact.happy_phone2(:fr, '.').should == "11.11.11.11.11"
        end
      end
    end
  end# }}}

end# }}}
