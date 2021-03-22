class SchedulesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update]
  before_action :correct_user, only: [:new, :create, :show, :edit, :update]
  before_action :schedule_find, only: [:show, :edit, :update]

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      @calendar = Calendar.find(params[:calendar_id])
    else
      render :new
    end
  end

  def show
    @genre = Genre.find_by(id: @schedule.genre_id)
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
    else
      render :edit
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:date, :schedule_name, :genre_id, :start_time, :end_time, :comment).merge(
      user_id: current_user.id, calendar_id: params[:calendar_id]
    )
  end

  def correct_user
    @calendar = Calendar.find(params[:calendar_id])
    redirect_to root_path unless @calendar.user_id == current_user.id
  end

  def schedule_find
    @schedule = Schedule.find(params[:id])
  end
end
