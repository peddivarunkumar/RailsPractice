class BookingsController < ApplicationController
    def create
      @user = Current.user
      event_id = params[:event_id].to_i
      @user.events << Event.find(params[:event_id].to_i)
  
    end
end
