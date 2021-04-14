class ShareSchedulesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :share_schedule_find, only: [:show, :edit, :edit, :update]
  before_action :correct_user

  def new
    @share_schedule = Schedule.new
  end

  def create
    @share_calendar = ShareCalendar.find(params[:share_calendar_id])
    @share_schedule = Schedule.new(schedule_params)
    if @share_schedule.save
    else
      render :new
    end
  end

  def show
    @genre = Genre.find_by(id: @schedule.genre_id)
    @share_calendar = ShareCalendar.find(params[:share_calendar_id])
  end

  def edit
  end

  def update
    @share_calendar = ShareCalendar.find(params[:share_calendar_id])
    if @schedule.update(schedule_params)
    else
      render :edit
    end
  end

  def destroy
    @share_calendar = ShareCalendar.find(params[:share_calendar_id])
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
  end

  private

  def schedule_params
    params.require(:schedule).permit(:date, :schedule_name, :genre_id, :start_time, :end_time, :comment).merge(
      user_id: current_user.id, calendar_id: @share_calendar.calendar_id
    )
  end

  def share_schedule_find
    @schedule = Schedule.find(params[:id])
  end

  def correct_user
    @share_calendar = ShareCalendar.find(params[:share_calendar_id])
    redirect_to root_path unless @share_calendar.user_id == current_user.id
  end
end
