class QuestsController < ApplicationController
  before_action :set_quest, only: %i[show edit update destroy]
  def index
    @quests = Quest.all
  end

  def show
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      redirect_to quest_path(@quest)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quest.update
      redirect_to quest_path(@quest)
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @quest.destroy
    redirect_to quests_path, status: :see_other
  end

  def generate
    max_time = params[:max_time].to_i
    matching_quests = Quest.where("duration_minutes <= ?", max_time)
    @quest = matching_quests.to_a.sample

    if @quest
      redirect_to quest_path(@quest)
    else
      redirect_to quests_path, alert: "No quests fit that time. Try a longer time."
    end
  end

  private

  def quest_params
    params.require(:quest).permit(:title, :description, :category, :difficulty, :duration_minutes)
  end

  def set_quest
    @quest = Quest.find(params[:id])
  end
end
