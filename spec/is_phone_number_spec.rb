# -*- encoding: utf-8 -*-

require 'spec_helper'

describe "format phone numbers from Iceland" do
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
end

