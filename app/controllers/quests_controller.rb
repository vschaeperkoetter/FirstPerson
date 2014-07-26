class QuestsController < ApplicationController

  def main
    @quests = Quest.all
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      redirect_to quests_path
      flash[:notice] = "Quest successfully created"
    else
      flash[:notice] = "Please try again"
      redirect_to quests_path
    end

  end

  private

  def quest_params
    params[:quest][:creator_id] = 1#current_user2.id
    params.require(:quest).permit(:creator_id, :title, :description, :user_limit, :category, :end_date)
  end

end
