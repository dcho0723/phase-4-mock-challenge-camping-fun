class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_validations_error

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def render_validations_error(invalid)
        render json: { errors: ["validations error"] }, status: :unprocessable_entity
        # render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end