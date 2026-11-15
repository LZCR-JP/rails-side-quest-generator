class CompletionsController < ApplicationController
  def create
    @quest = Quest.find(params[:quest_id])
    @completion = @quest.completions.new(completion_params)
    @completion.completed_at = Time.current
    if @completion.save
      redirect_to quest_path(@quest), notice: "Quest completed!"
    else
      redirect_to quest_path(@quest), notice: "Could not save completion."
    end
  end

  private

  def completion_params
    params.require(:completion).permit(:note, :rating)
  end
end
