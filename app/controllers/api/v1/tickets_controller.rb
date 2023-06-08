# frozen_string_literal: true

module Api
  module V1
    class TicketsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @tickets = Ticket.all
      end

      def create
        data = JSON.parse(request.body.read)

        ticket_data = data
        excavator_data = data.dig('Excavator')


        ticket = Ticket.new(
          request_number: ticket_data.dig('RequestNumber'),
          sequence_number: ticket_data.dig('SequenceNumber'),
          request_type: ticket_data.dig('RequestType'),
          request_action: ticket_data.dig('RequestAction'),
          response_due_datetime: ticket_data.dig('DateTimes', 'ResponseDueDateTime'),
          primary_service_area_code: ticket_data.dig('ServiceArea', 'PrimaryServiceAreaCode', 'SACode'),
          additional_service_area_codes: ticket_data.dig('ServiceArea', 'AdditionalServiceAreaCodes', 'SACode'),
          digsite_well_known_text: ticket_data.dig('ExcavationInfo', 'DigsiteInfo', 'WellKnownText')
        )

        excavator = ticket.build_excavator(
          company_name: excavator_data.dig('CompanyName'),
          address: excavator_data.dig('Address'),
          crew_on_site: excavator_data.dig('CrewOnsite')
        )

        if ticket.save
          render json: { message: 'Data saved successfully' }, status: :created
        else
          render json: { error: 'Failed to save data' }, status: :unprocessable_entity
        end
      end

      def show
        @ticket = Ticket.find(params[:id])
      end
    end
  end
end
