class WelcomeController < ApplicationController

    before_action :authenticate_user!, only: [:trigger_event_a, :trigger_event_b]

    def index
    end

    def trigger_event_a
    end

    def trigger_event_b
    end

end