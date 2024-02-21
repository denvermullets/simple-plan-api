module Api
  module V1
    class CoachStudentBookingReviewsController < ApplicationController
      before_action :set_coach_student_booking_review, only: %i[ show update destroy ]

      # GET /coach_student_booking_reviews
      def index
        @coach_student_booking_reviews = CoachStudentBookingReview.all

        render json: @coach_student_booking_reviews
      end

      # GET /coach_student_booking_reviews/1
      def show
        render json: @coach_student_booking_review
      end

      # POST /coach_student_booking_reviews
      def create
        @coach_student_booking_review = CoachStudentBookingReview.new(coach_student_booking_review_params)

        if @coach_student_booking_review.save
          render json: @coach_student_booking_review, status: :created, location: @coach_student_booking_review
        else
          render json: @coach_student_booking_review.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /coach_student_booking_reviews/1
      def update
        if @coach_student_booking_review.update(coach_student_booking_review_params)
          render json: @coach_student_booking_review
        else
          render json: @coach_student_booking_review.errors, status: :unprocessable_entity
        end
      end

      # DELETE /coach_student_booking_reviews/1
      def destroy
        @coach_student_booking_review.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_coach_student_booking_review
          @coach_student_booking_review = CoachStudentBookingReview.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def coach_student_booking_review_params
          params.require(:coach_student_booking_review).permit(:coach_student_booking_id, :score, :notes)
        end
    end
  end
end