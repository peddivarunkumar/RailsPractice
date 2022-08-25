class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
       @event = Event.new(event_params)
       if @event.save!
          redirect_to events_path
       else
          render :new
       end
    end

   def show_user_events
      @events = Current.user.events
   end

    private
      def event_params
         params.require("event").permit(:name,:description,:start_date,:end_date,:picture_attributes => {})
      end
end
