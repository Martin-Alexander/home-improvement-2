module Api
  class ApplicationController < ActionController::API
    include ActionController::Caching

    before_action :authenticate_user!

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :respond_with_forbidden
    rescue_from ActiveRecord::RecordNotFound, with: :respond_with_not_found

    private

    def respond_with_forbidden(error)
      render json: { message: error.message }, status: :forbidden
    end

    def respond_with_not_found(error)
      render json: { message: error.message }, status: :not_found
    end
  end
end