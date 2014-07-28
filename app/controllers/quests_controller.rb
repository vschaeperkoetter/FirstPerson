class QuestsController < ApplicationController

  include UsersHelper

  def all
    @user_quest = UserQuest.new
    @quests = Quest.all.select { |quest| quest.checkpoints.length >= 1  }
    @hash = Gmaps4rails.build_markers(@quests) do |quest, marker|
      if quest.checkpoints.length >= 1 # Why are we doing this twice?
        marker.lat quest.checkpoints.first.location.latitude
        marker.lng quest.checkpoints.first.location.longitude
        marker.infowindow "<iframe src='/accept?quest_id=#{quest.id}'></iframe>"
      end
    end
    render json: @hash
  end

  def accept_form
    @user_quest = UserQuest.new
    @quest = Quest.find(params[:quest_id])
    render layout: false
  end

  def main
    @quests = Quest.all
    @user_quest = UserQuest.new
    @quest = Quest.new
  end


  def accept
    @user_quest = UserQuest.new(user_quest_params)

    if @user_quest.save
       redirect_to accepted_path
      flash[:notice] = "Quest successfully accepted"
    else
      flash[:notice] = "Please try again"
       redirect_to rejected_path
    end

  end


  def create
    @checkpoint = Checkpoint.new
    @quest = Quest.new(quest_params)
    if @quest.save
      render partial: 'quests/quest_loc'
    else
      flash[:notice] = "Please try again"
      render partial: 'quests/rejected'
    end

  end

  def set_location
    # There should be a way to use strong params to do this...
    @location = Location.new
    @location.name = params[:checkpoint][:locations][:name]
    @location.street = params[:checkpoint][:locations][:street]
    @location.city = params[:checkpoint][:locations][:city]
    @location.state = params[:checkpoint][:locations][:state]
    @location.zip = params[:checkpoint][:locations][:zip]
    @location.save

    params[:checkpoint][:location_id] = @location.id

    @checkpoint = Checkpoint.new(checkpoint_params)
    if @checkpoint.save
      render json: search_venues
    else
      flash[:notice] = "Please try again"
      redirect_to quests_path
    end

  end

  def commit_location
    @location = Location.last #this needs to be changed to something that can handle concurrency
    @location.update(venue_params)
    redirect_to quests_path
  end

  def accepted
  end

  def rejected
  end

  def search_venues
    query = @location.name
    ll = [@location.latitude, @location.longitude].join(',')
    api = Fsqr.new(session[:token])
    @venues = api.search(query, ll)
    @venues[]
  end

  private

  def checkpoint_params
    params.require(:checkpoint).permit(:instructions, :quest_id, :location_id)
  end

  def user_quest_params ## BUGBUG!!!!!
    params[:user_quest][:user_id] = current_user2.id #hard code to 1 for local
    params.require(:user_quest).permit(:user_id, :quest_id, :completed)
  end

  def quest_params ## BUGBUG!!!!!
    params[:quest][:creator_id] = current_user2.id #hard code to 1 for local
    params.require(:quest).permit(:creator_id, :title, :description, :user_limit, :category, :end_date)
  end

  def venue_params
    params.require(:venue).permit(:name, :venue_type, :second_type, :latitude, :longitude, :foursquare_id, :street, :city, :state, :zip, :country)
  end

end
