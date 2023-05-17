class GymsController < ApplicationController

        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
        rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
      

    def show
        gym = Gym.find_by!(id: params[:id])
        render json: gym
    end
        

    def destroy
        gym = Gym.find_by!(id: params[:id])
        gym.destroy
        head :no_content
    end

    private
      
    def render_not_found_response(exception)
      render json: { error: "Gym not found" }, status: :not_found
    end
  
    def render_unprocessable_entity_response(exception)
      render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end
