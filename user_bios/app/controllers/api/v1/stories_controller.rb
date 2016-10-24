class Api::V1::StoriesController < ApplicationController
   before_action :set_story, only: [:show, :update, :destroy]

  def index
    @stories = Story.all
    render json: @stories
  end

  def show
    render json: @story
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      render json: @story, status: :created
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  def update
    if @story.update(story_params)
      render json: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @story.destroy
  end

  private

  def set_story
    @story ||= Story.find(params[:id])
  end

  def story_params
    params.require(:story)
      .permit(:content, :user_id)
  end
end
