# frozen_string_literal: true

module Api
  module V1
    class NotesController < ApplicationController
      def index
        render json: Note.recent, status: :ok
      end

      def create
        note = Note.create!(note_params)
        render json: note, status: :created
      end

      private

      def note_params
        params.require(:note).permit(:title, :content)
      end
    end
  end
end