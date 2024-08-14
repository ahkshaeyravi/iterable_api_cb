class IterableService
    
    include HTTParty
    
    base_uri 'https://api.iterable.com/api'
  
    def initialize()
      @headers = { "Authorization" => 'de933823ndme318mo2!cf428G', "Content-Type" => "application/json" }
    end
  
    def create_event(user_id, event_name)
      VCR.use_cassette("create_event_#{event_name}") do
        body = { "userId" => user_id, "eventName" => event_name }.to_json
        self.class.post('/events/track', headers: @headers, body: body)
      end
    end
  
    def send_email(user_id, email_template_id)
      VCR.use_cassette("send_email_#{email_template_id}") do
        body = { "recipientEmail" => user_id, "campaignId" => email_template_id }.to_json
        self.class.post('/email/target', headers: @headers, body: body)
      end
    end
  
    def list_events(user_id)
      VCR.use_cassette("list_events_#{user_id}") do
        self.class.get("/events/get?userId=#{user_id}", headers: @headers)
      end
    end
  end
  