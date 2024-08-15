class EventsController < ApplicationController

    before_action :authenticate_user!, only: [:trigger_event_a, :trigger_event_b]
    before_action :set_iterable_service, only: [:trigger_event_a, :trigger_event_b]
    
    def index
    end
  
    def trigger_event_a
      response = @iterable_service.create_event(current_user.id, 'Event A')
      if response.success?
        flash[:notice] = "Event A created successfully!"
      else
        flash[:alert] = "Failed to create Event A."
      end
    end
  
    def trigger_event_b
      response = @iterable_service.create_event(current_user.id, 'Event B')
      if response.success?
        send_event_b_notifications
        flash[:notice] = "Event B created and notifications sent!"
      else
        flash[:alert] = "Failed to create Event B."
      end
    end
  
    private
  
    def set_iterable_service
      @iterable_service = IterableService.new()
    end
  
    def send_event_b_notifications
      events = @iterable_service.list_events(current_user.id)
      events = events.parsed_response
      events = events["events"]
      events.each do |event|
        if event['eventName'] == 'Event B'
          @iterable_service.send_email(current_user.id, 1)
        end
      end
    end
end