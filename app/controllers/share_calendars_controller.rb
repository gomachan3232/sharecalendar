class ShareCalendarsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :destroy]
  before_action :correct_user, only: [:show, :destroy]

  def show
    @schedules = Schedule.all
  end

  def destroy
    @share_calendar.destroy
  end

  private

  def correct_user
    @share_calendar = ShareCalendar.find(params[:id])
    redirect_to root_path unless @share_calendar.user_id == current_user.id
  end
end
