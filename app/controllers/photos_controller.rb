class PhotosController < ApplicationController
    before_action :set_booking

    def create
        add_more_pictures(photos_params[:photos])
        flash[:error] = "Failed uploading images" unless @booking.save
    end

    def destroy
        remove_photo_at_index(params[:id].to_i)
        flash[:error] = "Failed deleting image" unless @booking.save
        redirect_to :back
    end

    private

    def set_booking
        @booking = Booking.find(params[:booking_id])
    end

    def add_more_photos(new_photos)
        photos = @booking.photos
        photos += new_photos
        @booking.photos = photos
    end

    def remove_photo_at_index(index)
        remain_photos = @booking.photos # copy the array
        deleted_photo = remain_photos.delete_at(index) # delete the target image
        deleted_photo.try(:remove!) # delete image from S3
        @booking.photos = remain_photos # re-assign back
      end

      def images_params
        params.require(:booking).permit({photos: []}) # allow nested params as array
      end
end
