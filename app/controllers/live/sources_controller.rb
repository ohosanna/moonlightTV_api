module Live
  class SourcesController < ApplicationController

    def index
      @channel = Channel.find_by!(id: params[:channel_id])
      @sources = @channel.sources
      render json: @sources
    end

    def create
      @channel = Channel.find_by!(id: params[:channel_id])
      @source= @channel.sources.new(source_params)
      if @source.save
        render json: @source, status: :created
      else
        render json: { errors: @source.errors }, status: :unprocessable_entity
      end
    end

    def update
      @channel = Channel.find(params[:id])
      if @channel.update(channel_params)
        render json: @channel, status: :created
      else
        render json: { errors: @channel.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      @channel = Channel.find(params[:id])
      @channel.destroy
      head 204
    end

    private
    def source_params
      params.permit(:url)
    end

  end
end
