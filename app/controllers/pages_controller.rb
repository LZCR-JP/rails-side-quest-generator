class PagesController < ApplicationController
  def home
  end

  def progress
    @completed_count = Completion.count
    @average_rating = Completion.average(:rating)&.round(1)
    @recent_completions = Completion.includes(:quest).order(completed_at: :desc).limit(10)
  end
end
