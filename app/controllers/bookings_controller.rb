require 'booking_decorator'
require 'my_logger'

class BookingsController < ApplicationController
  #original: before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :set_booking, only: %i[ show ] #only show bookings before signing in
  before_action :user_signed_in?, only:[:edit, :create, :update, :destroy]
  #before_action :authenticate_user!
  #before_action :admin?, only: [:destroy]
  
  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)
    #@booking = Booking.new()
    #@booking.name = params [:booking][:name]
    #@booking.date = params [:booking][:date]
    #@booking.time = params [:booking][:time]
    #@booking.size = params [:booking][:size]
    #@booking.note = params [:booking][:note]

    #checkedBooking = BasicBooking.new(booking.size)

    #checkedBooking = DecoratedBooking.new(checkedBooking)

    #@booking.note = @booking.note + " " + checkedBooking.size
    
    logger = MyLogger.instance
    logger.logInfo("New Booking Created: " +@booking.name)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy
    
    logger = MyLogger.instance
    logger.logInfo("Booking Destroyed: " +@booking.name)

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:name, :date, :time, :size, :note)
    end

end
