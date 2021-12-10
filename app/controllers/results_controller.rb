class ResultsController < ApplicationController

  before_action :set_result, only: [:show, :update, :result, :gist]

  def show; end

  def result; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@result.current_question).call

    if result.status == 201
      flash[:notice] = t('.success')
      #flash[:alert] = "#{result.data[:url]}"
      flash[:alert] = "https://gist.github.com/#{result.data[:owner][:login]}/#{result.data[:id]}"
      gist = current_user.gists.build(url: "https://gist.github.com/#{result.data[:owner][:login]}/#{result.data[:id]}")
      gist.question = @result.current_question
      gist.save!
    else
      flash[:alert] =  t('.failure')
    end

    redirect_to @result

  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
