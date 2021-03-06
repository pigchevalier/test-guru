class ResultsController < ApplicationController
  before_action :set_result, only: %i[show update result]

  def show; end

  def result; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed? 
      receive_badge = GettingBadge.new
      receive_badge.new_badge(@result, current_user)
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
