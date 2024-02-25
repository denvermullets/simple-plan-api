module Api
  module V1
    class CoachesController < ApplicationController
      before_action :set_coach, only: %i[show update]

      # GET /coaches
      def index
        @coaches = Coach.all

        render json: @coaches
      end

      # GET /coaches/1
      def show
        coach_info = @coach.as_json(
          include: {
            coach_student_bookings: {
              include: { student: { only: %i[first_name last_name] } },
              except: %i[created_at updated_at] },
            coach_student_booking_reviews: { except: %i[created_at updated_at] }
          },
          except: %i[created_at updated_at]
        )

        render json: coach_info, status: :ok
      end

      # POST /coaches
      def create
        @coach = Coach.new(coach_params)

        if @coach.save
          render json: @coach, status: :created, location: @coach
        else
          render json: @coach.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /coaches/1
      def update
        if @coach.update(coach_params)
          render json: @coach
        else
          render json: @coach.errors, status: :unprocessable_entity
        end
      end

      def available_session_slots
        hours_available = CoachSession::AvailableSlots.call(
          coach_id: params[:coach_id], date: params[:date], time_zone: params[:time_zone]
        )

        render json: { available_start_times: hours_available }, status: :ok
      end

      private

      def set_coach
        @coach = Coach.find(params[:id])
      end

      def coach_params
        params.require(:coach).permit(:first_name, :last_name, :slug)
      end
    end
  end
end
