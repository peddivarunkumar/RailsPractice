class BookingsController < ApplicationController
    def create
      @user = Current.user
      @user.events << Event.find(params[:event_id].to_i)
    end
end
