# frozen_string_literal: true
module Api
  module V1
    class NotesController < ApplicationController
      def index
        render json: Note.order(created_at: :desc), status: :ok
      end

      def create
        note = Note.new(note_params)

        if note.save
          render json: note, status: :created
        else
          render json: { errors: note.errors.to_hash(true) }, status: :unprocessable_entity
        end
      end

      private

      def note_params
        params.require(:note).permit(:title, :content)
      end
    end
  end
end
