# -*- encoding: utf-8 -*-

require 'spec_helper'

describe HappyPhoneNumber do

  describe "#respond_to?" do# {{{
    before { @contact = Contact.new(phone: "0123456789", phone2: "1111111111") }
    specify { @contact.should respond_to(:happy_phone) }
    specify { @contact.should respond_to(:happy_inter_phone) }
    specify { @contact.should respond_to(:happy_phone2) }
    specify { @contact.should respond_to(:happy_inter_phone2) }
  end# }}}

  context "with free format" do# {{{
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

  end# }}}

  context "with french phone number" do# {{{
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

  context "with phone number form Belgium" do# {{{
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

  end# }}}

  context "with phone number form Denmark" do# {{{
    before { @contact = Contact.new(phone: "12345678") }

    describe "with :dk as 1st arg" do
      specify { @contact.happy_phone(:dk).should == "12 34 56 78" }
      describe "with '-' as second arg" do
        specify { @contact.happy_phone(:dk, '-').should == "12-34-56-78" }
      end
    end

    describe "with :DK as 1st arg" do
      specify { @contact.happy_phone(:DK).should == "12 34 56 78" }
      describe "with '-' as second arg" do
        specify { @contact.happy_phone(:DK, '-').should == "12-34-56-78" }
      end
    end

    describe "#happy_inter_*" do
      specify { @contact.happy_inter_phone(:dk).should == "+45 12 34 56 78" }
      describe "with '-' as second arg" do
        specify do
          @contact.happy_inter_phone(:dk, '-').should == "+45-12-34-56-78"
        end
      end
    end
  end# }}}

  context "with phone numbers from Iceland" do# {{{
    before { @contact = Contact.new(phone: "1234567") }

    describe "with :is as 1st arg" do
      specify { @contact.happy_phone(:is).should == "123 4567" }
      describe "with '-' as second arg" do
        specify { @contact.happy_phone(:is, '-').should == "123-4567" }
      end
    end

    describe "with :IS as 1st arg" do
      specify { @contact.happy_phone(:IS).should == "123 4567" }
      describe "with '-' as second arg" do
        specify { @contact.happy_phone(:IS, '-').should == "123-4567" }
      end
    end

    describe "#happy_inter_*" do
      specify { @contact.happy_inter_phone(:is).should == "+354 123 4567" }
      describe "with '-' as second arg" do
        specify do
          @contact.happy_inter_phone(:is, '-').should == "+354-123-4567"
        end
      end
    end
  end# }}}

end
