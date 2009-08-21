class Customer < Person
  has_attributes_from :customer_detail

  validates_format_of :phone, :with=>/^\d{10}$/, :allow_blank=>true, :message=>"Only and exactly 10 numbers [0-9]"
  validates_length_of :phone, :within => 10..10, :allow_blank=>true
end
