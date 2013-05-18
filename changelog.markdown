version 0.0.3 (2013-05-18)
==========================

* **API break** Add `#happy_mask_* method`.
	Mask formatting have now its own method. So one can call `#happy_phone`
	with a string:

      happy_phone("fr")


version 0.0.2 (2013-05-08)
==========================

* **API break** `happy_phone(:international)` is removed. You can use
  instead `happy_inter_phone(:fr)`
* Add support for Belgium
* Add support for Denmark
* Add support for Iceland
* Make it easy to add a formatter for a new country
* Add a masking method, to display phone numbers from unsupported countries


version 0.0.1 (2013-05-03)
==========================

First version. Know only about french phone numbers.

