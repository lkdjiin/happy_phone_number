# -*- encoding: utf-8 -*-

require 'spec_helper'

describe "format phone number form Denmark" do
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
end

