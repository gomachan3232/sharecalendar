class CalendarsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :destroy, :share_user, :share_calendar, :share_calendar_create]
  before_action :correct_user, only: [:show]
  before_action :all_share_calendars, only: [:index, :share_calendar, :share_calendar_create]
  before_action :all_calendars, only: [:index, :share_calendar, :share_calendar_create]

  def index
    @schedules = Schedule.all.order(date: :asc)
    @week_schedules = @schedules.where(date: Date.today...Date.today.since(8.days))
    if user_signed_in?
      @share_calendar_ids = current_user.share_calendars.pluck(:calendar_id)
      @calendar_ids = Calendar.where(user_id: current_user.id)
    end
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
  end

  def share_calendar_create
    @calendar = Calendar.find(params[:id])
    @user = User.find(params[:user_id])
    @share_calendar = ShareCalendar.new(calendar_id: params[:id], user_id: @user.id)
    @share_calendars.each do |share_calendar|
      next unless share_calendar.user_id == @share_calendar.user_id && share_calendar.calendar_id == @share_calendar.calendar_id

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

  def correct_user
    @calendar = Calendar.find(params[:id])
    redirect_to root_path unless @calendar.user_id == current_user.id
  end

  def all_share_calendars
    @share_calendars = ShareCalendar.all
  end

  def all_calendars
    @calendars = Calendar.all
  end
end
