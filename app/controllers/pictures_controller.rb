class PicturesController < ApplicationController
    before_action :set_booking

    def create
        add_more_pictures(pictures_params[:photos])
        flash[:error] = "Failed uploading images" unless @booking.save
    end

    def destroy
        remove_picture_at_index(params[:id].to_i)
        flash[:error] = "Failed deleting image" unless @booking.save
        redirect_to :back
    end

    private

    def set_booking
        @booking = Booking.find(params[:booking_id])
    end

    def add_more_pictures(new_pictures)
        pictures = @booking.pictures
        pictures += new_pictures
        @booking.pictures = pictures
    end

    def remove_picture_at_index(index)
        remain_pictures = @booking.pictures # copy the array
        deleted_picture = remain_pictures.delete_at(index) # delete the target image
        deleted_picture.try(:remove!) # delete image from S3
        @booking.pictures = remain_pictures # re-assign back
      end

      def images_params
        params.require(:booking).permit({pictures: []}) # allow nested params as array
      end
end
