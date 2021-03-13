class CalendarsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @calendars = Calendar.all
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
  end

  private

  def calendar_params
    params.require(:calendar).permit(:calendar_name).merge(user_id: current_user.id)
  end
end
