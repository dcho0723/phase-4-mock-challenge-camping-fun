class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_validations_error

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by!(id: params[:id])
        render json: camper
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
    end

    def render_validations_error(invalid)
        render json: { errors: ["validations error"] }, status: :unprocessable_entity
        # render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
    
end
