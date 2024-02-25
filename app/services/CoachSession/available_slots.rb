# this service will take in a Coach and a Date and will return an array of open time slots

module CoachSession
  class AvailableSlots < Service
    def initialize(coach_id:, date:, time_zone:)
      @date = date
      @time_zone = time_zone
      @sessions = CoachStudentBooking.where(coach_id:, date:)
    end

    def call
      # just going to preemptively block old dates from being available
      return [] if Time.use_zone(@time_zone) { Time.zone.parse(@date) <= Date.current }

      # if we want to have flexitility to have custom hours of operation, we could add as argument for init
      hours_in_day = generate_hours_for_day('09:00', '17:00')

      check_against_existing_sessions(hours_in_day)
    end

    private

    def generate_hours_for_day(start_time, end_time)
      # we want to parse for a given date so that we can check against existing records later
      # returns an array of times for the whole day before exclusion
      hours = []
      Time.use_zone(@time_zone) do
        current_time = Time.zone.parse("#{@date} #{start_time}")

        while current_time + 2.hours <= Time.zone.parse("#{@date} #{end_time}")
          hours << current_time
          current_time += 2.hours
        end
      end

      hours
    end

    def check_against_existing_sessions(hours_in_day)
      current_utc_time = Time.now.utc

      hours_in_day.reject do |hour|
        # hopefully checking current time and removing earlier hours to avoid booking in the past
        # as well as making sure any existing bookings can't be overbooked
        hour_in_utc = hour.in_time_zone('UTC')
        hour_in_utc < current_utc_time || @sessions.any? { |session| hour_in_utc == session.start_at }
      end
    end
  end
end
