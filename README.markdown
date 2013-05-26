Happy Phone Number [![Build Status](https://travis-ci.org/lkdjiin/happy_phone_number.png)](https://travis-ci.org/lkdjiin/happy_phone_number) [![Gem Version](https://badge.fury.io/rb/happy_phone_number.png)](http://badge.fury.io/rb/happy_phone_number)
================

Description
----------------------

*Happy Phone Number* provides easy methods to format phone
numbers from your Rails models. Virtually any country specific
format or convention could be supported, including national and international
format. For the not (yet) supported countries, a general method
using a simple mask is also provided.

Overview
-----------------------

### Prerequisite

  * Phone number **must be save** with digits only. So, without spaces, hyphens,
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

Or maybe with a string:

    <%= @contact.happy_phone('fr') %>
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

    <%= @contact.happy_mask_phone("#### ###-###") %>
    #=> "0123 456-789"


Install
-------------------------

Add this line in your Gemfile:

    gem 'happy_phone_number'


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

Supported Countries
--------------------------

<table>
<tr>
  <th>Name</th>
  <th>Symbol</th>
</tr>
<tr>
  <td>Belgium</td>
  <td>:be</td>
</tr>
<tr>
  <td>Denmark</td>
  <td>:dk</td>
</tr>
<tr>
  <td>France</td>
  <td>:fr</td>
</tr>
<tr>
  <td>Iceland</td>
  <td>:is</td>
</tr>
</table>

Dependencies
--------------------------

  * ruby >= 1.9.2
  * rails >= 3.2

Contributing
-------------------------

*I don't know much about format and convention for every possible country.
Feel free to send me documentation for the phone number formatting and
convention for your country. Or contribute to the code by adding any
missing formatter.*

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### How to add a formatter for your country

Name the file as follow:

    aa_format.rb

where "aa" is the ISO code of the country.
See [ISO country codes] [1].

Put this file in the lib/happy_phone_number/ folder. Then follow the structure of
an existed formatter:

  * fr_format.rb is a good starting point
  * dk_format.rb is the simplest one
  * be_format.rb is a little more complex

Feel free to ask for help if you have any troubles.


### There is many other ways to contibute to FIXME

1. Report any bug
2. Give me ideas
3. Correct my poor english syntax
4. Blog about *Happy Phone Number*
5. Tell *Happy Phone Number* to your friends and colleagues

License
--------------------------

MIT


Questions and/or Comments
--------------------------

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions, or contact me on [twitter](https://twitter.com/lkdjiin).

[1]: http://en.wikipedia.org/wiki/ISO_3166-1 "ISO country codes on wikipedia"
