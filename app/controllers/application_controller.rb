# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  private

  def render_unprocessable_entity(exception)
    render json: { errors: exception.record.errors.messages }, status: :unprocessable_entity
  end
end