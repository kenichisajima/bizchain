class ToppagesController < ApplicationController
  def index
    if logged_in?
      @meetings = Meeting.order(id: :desc).page(params[:page])
    end
  end
end
