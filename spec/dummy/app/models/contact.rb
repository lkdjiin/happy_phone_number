class Contact < ActiveRecord::Base
  attr_accessible :phone, :phone2
  happy_phone_number
end
