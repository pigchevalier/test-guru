class GistsController < ApplicationController

  def create
    @result = Result.find(params[:id])
    result = GistQuestionService.new(@result.current_question).call

    if result.success?
      flash[:notice] = t('.success')
      flash[:alert] = result.url
      gist = current_user.gists.build(url: result.hash)
      gist.question = @result.current_question
      gist.save!
    else
      flash[:alert] =  t('.failure')
    end

    redirect_to @result
  end
end
