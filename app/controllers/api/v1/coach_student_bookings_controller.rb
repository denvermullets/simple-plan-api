module Api
  module V1
    class CoachStudentBookingsController < ApplicationController
      before_action :set_coach_student_booking, only: %i[ show update destroy ]

      # GET /coach_student_bookings
      def index
        @coach_student_bookings = CoachStudentBooking.all

        render json: @coach_student_bookings
      end

      # GET /coach_student_bookings/1
      def show
        render json: @coach_student_booking
      end

      # POST /coach_student_bookings
      def create
        @coach_student_booking = CoachStudentBooking.new(coach_student_booking_params)

        if @coach_student_booking.save
          render json: @coach_student_booking, status: :created, location: @coach_student_booking
        else
          render json: @coach_student_booking.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /coach_student_bookings/1
      def update
        if @coach_student_booking.update(coach_student_booking_params)
          render json: @coach_student_booking
        else
          render json: @coach_student_booking.errors, status: :unprocessable_entity
        end
      end

      # DELETE /coach_student_bookings/1
      def destroy
        @coach_student_booking.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_coach_student_booking
          @coach_student_booking = CoachStudentBooking.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def coach_student_booking_params
          params.require(:coach_student_booking).permit(:coach_id, :student_id, :date, :start_at, :end_at, :completed)
        end
    end
  end
end
