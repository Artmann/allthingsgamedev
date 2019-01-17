class TalksController < ApplicationController

  def index
      @talks = ContentService.instance.list_talks.sort { |a, b| b.created_at <=> a.created_at }
  end

  def show
      # The id is really the slug
      slug = params[:id]
      @talk = ContentService.instance.find_talk(slug)
      @title = @talk.title
  end
end
