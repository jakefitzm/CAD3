require 'booking_decorator'

class BasicBooking
    def initialize(size)
        @size = size
    end

    def size
        return @size
    end
end

class DecoratedBooking < BasicBooking
    def initialize(basic_booking)
        @basic_booking = basic_booking
        super(@basic_booking.size)
    end

    def servicecharge
        if size > 6
            return "Service charge of 12.5% applies to your group"
        elsif size < 6
            return "No Mandatory Service Charge Applies"
        end
    end   
end 