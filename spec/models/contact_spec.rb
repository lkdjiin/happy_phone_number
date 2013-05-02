require 'spec_helper'

describe Contact do
  before { @contact = Contact.new(phone: "0123456789", phone2: "1111111111") }
  specify { @contact.should respond_to(:phone) }
  specify { @contact.should respond_to(:phone2) }
end
