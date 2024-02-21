module Api
  module V1
    class UsersController < ApplicationController
      def index
        coaches = Coach.all.limit(20)
        students = Student.all.limit(20)
        users = coaches + students

        render json: users, status: :ok
      end
    end
  end
end
