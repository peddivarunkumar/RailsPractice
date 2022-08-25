class BookingsController < ApplicationController
    def create
      @user = Current.user
      event_id = params[:event_id].to_i
      @user.events << Event.find(params[:event_id].to_i)
      redirect_to show_user_events_path
    end
end
