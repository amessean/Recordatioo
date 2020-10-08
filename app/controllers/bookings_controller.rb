class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :show_photo]

    def index
      if params[:query].present?
        sql_query = " \
          bookings.title ILIKE :query \
          OR bookings.category ILIKE :query \
          OR bookings.place ILIKE :query \
        "
        if @bookings
          @future_bookings = @bookings.select {|booking| booking.start_time > Date.today}
          @future_bookings = Booking.where(sql_query, query: "%#{params[:query]}%")
          @previous_bookings = @bookings.reject {|booking| booking.start_time > Date.today}
          @previous_bookings = Booking.where(sql_query, query: "%#{params[:query]}%")
        else
          @bookings = Booking.all.where(user: current_user)
        end
      else
        @bookings = Booking.all.where(user: current_user)
        @future_bookings = @bookings.select {|booking| booking.start_time > Date.today}
        @previous_bookings = @bookings.reject {|booking| booking.start_time > Date.today}
      end
    end

    def show
    end

    def show_photo
      @photo = Photo.find(params[:photo_id])
    end

    def new
      @booking = Booking.new
    end

    def create
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      respond_to do |format|
        if @booking.save
          store_photos
          format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @booking.update(booking_params)
          delete_photos
          store_photos
          format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @booking.destroy
      respond_to do |format|
        format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      end
    end

  private

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:title, :category, :place, :user_id, :start_time, :end_time, :guest => [])
    end

    def store_photos
      photos = params[:booking][:photos]
      photos.each{|photo| @booking.photos.create(image: photo)} if photos
    end

    def delete_photos
      @booking.photos.each do |photo|
        photo.destroy if params[photo.id.to_s] == "delete"
      end
    end
  end
