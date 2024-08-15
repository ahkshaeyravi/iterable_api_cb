require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  
    describe 'POST #trigger_event_a' do
    let(:user) { create(:user) } 
    let(:iterable_service) { double('IterableService') } 
    let(:response_double) { double('Response') } 

    before do
      allow(controller).to receive(:current_user).and_return(user) # Mock current_user
      allow(IterableService).to receive(:iterable_service).and_return(iterable_service) # Mock iterable_service
    end

    context 'when the event is successfully created' do
      it 'sets a success flash message' do
        # Mock the response of create_event to be successful
        allow(response_double).to receive(:success?).and_return(true)
        allow(iterable_service).to receive(:create_event).with(user.id, 'Event A').and_return(response_double)

        post :trigger_event_a

        expect(flash[:notice]).to eq("Event A created successfully!")
        # expect(response).to redirect_to(some_path) # Replace with the actual path
      end
    end

    context 'when the event creation fails' do
      it 'sets a failure flash message' do
        # Mock the response of create_event to be unsuccessful
        allow(response_double).to receive(:success?).and_return(false)
        allow(IterableService).to receive(:create_event).with(user.id, 'Event A').and_return(response_double)

        post :trigger_event_a

        expect(flash[:alert]).to eq("Failed to create Event A.")
        # expect(response).to redirect_to(some_path) # Replace with the actual path
      end
    end

  end

end
