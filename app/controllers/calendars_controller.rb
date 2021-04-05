class CalendarsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :destroy]

  def index
    @calendars = Calendar.all
    @share_calendars = ShareCalendar.all
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @calendar = Calendar.find(params[:id])
    @schedules = Schedule.all
  end

  def destroy
    @calendar = Calendar.destroy(params[:id])
  end

  def share_user
    @user = if params[:email].present?
              User.where(email: params[:email].to_s)
            else
              User.none
            end
  end

  def share_calendar
    @user = User.find(params[:id])
    @calendars = Calendar.all
    @share_calendars = ShareCalendar.all
  end

  def share_calendar_create
    @calendar = Calendar.find(params[:id])
    @user = User.find(params[:user_id])
    @share_calendar = ShareCalendar.new(calendar_id: params[:id], user_id: @user.id)
    @share_calendars = ShareCalendar.all
    @share_calendars.each do |share_calendar|
      next unless share_calendar.user_id == @share_calendar.user_id && share_calendar.calendar_id == @share_calendar.calendar_id

      @calendars = Calendar.all
      flash.now[:alert] = "#{@share_calendar.calendar.calendar_name}のカレンダーは既に共有されています"
      render :share_calendar
      return
    end
    @share_calendar.save
  end

  private

  def calendar_params
    params.require(:calendar).permit(:calendar_name).merge(user_id: current_user.id)
  end
end
