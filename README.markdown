Happy Phone Number [![Build Status](https://travis-ci.org/lkdjiin/happy_phone_number.png)](https://travis-ci.org/lkdjiin/happy_phone_number)
================

Description
----------------------
A rails plugin to happily format phone numbers.

**Early stage. Work in progress.**

Overview
-----------------------

### Prerequisite

  * Phone number **must be save** with digits only. So, without spaces, hyphen,
    or dots. Just digits.

### Demonstration

Let's say you have a `Contact` model with a `phone` attribute.

To display the phone number you could do this:

    <%= @contact.phone %>
    #=> "0123456789"

Using *Happy Phone Number* you could do that:

    <%= @contact.happy_phone(:fr) %>
    #=> "01 23 45 67 89"

Or in uppercase if you prefer:

    <%= @contact.happy_phone(:FR) %>
    #=> "01 23 45 67 89"

If you want an international format:

    <%= @contact.happy_inter_phone(:fr) %>
    #=> "+33 1 23 45 67 89"

What if you want dots as separator?

    <%= @contact.happy_phone(:fr, '.') %>
    #=> "01.23.45.67.89"

What if your model have several phone attributes, like `phone1`, `phone2`
and `mobile`, or maybe `portable`?

    <%= @contact.happy_phone1(:fr) %>
    #=> "11 11 11 11 11"
    <%= @contact.happy_phone2(:fr) %>
    #=> "22 22 22 22 22"
    <%= @contact.happy_mobile(:fr) %>
    #=> "33 33 33 33 33"
    ...

Now, imagine you live in Belgium, where phone numbers could have 2 formats:

    <%= @contact.happy_phone(:be) %>
    #=> "03 111 22 33"

    <%= @contact.happy_phone2(:be) %>
    #=> "063 11 22 33"

    <%= @contact.happy_inter_phone(:be) %>
    #=> "+32 3 111 22 33"

    <%= @contact.happy_inter_phone2(:be) %>
    #=> "+32 63 11 22 33"

And if *Happy Phone Number* don't know your country, you could use a
**mask formatting**:

    <%= @contact.happy_phone("#### ###-###") %>
    #=> "0123 456-789"

### Caveats

*Happy Phone Number* know only french and belgian phone numbers for the time
being. You could contribute to add formatting for your country. It's not so
hard, let me know if you need some help.

*Mask formatting* doesn't work for international phone number format.

Install
-------------------------

Add this line in your Gemfile:

    gem 'happy_phone_number', :git => 'git://github.com/lkdjiin/happy_phone_number.git'


Usage
--------------------------

Add the `happy_phone_number` method in your model. Example:

    class Contact < ActiveRecord::Base
      attr_accessible :email, :name, :phone, :fax
      happy_phone_number
    end

Now, in your views, you can use:

    happy_phone(:fr)
    happy_fax(:fr)
    ...

Dependencies
--------------------------

ruby >= 1.9.2
rails >= 3.2

License
--------------------------

MIT


Questions and/or Comments
--------------------------

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions, or contact me on [twitter](https://twitter.com/lkdjiin).
