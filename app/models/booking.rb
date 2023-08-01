class Booking < ApplicationRecord
    #validate before writing to table in database
    validates :name, :presence => true, length: {minimum: 3, message: "must have 3+ letters"}

end
