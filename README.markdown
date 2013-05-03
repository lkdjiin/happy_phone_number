Happy Phone Number [![Build Status](https://travis-ci.org/lkdjiin/happy_phone_number.png)](https://travis-ci.org/lkdjiin/happy_phone_number)
================

Description
----------------------
A rails plugin to happily format phone numbers.

**Early stage. Work in progress.**

Overview
-----------------------

Let's say you have a `Contact` model with a `phone` attribute. The phone number
**must be save** without spaces, or hyphen, or dots...

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

    <%= @contact.happy_phone(:international) %>
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
with any questions.
