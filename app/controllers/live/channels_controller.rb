module Live
  class ChannelsController < ApplicationController
    before_action :set_group, only: [:index, :create]

    def index
      @channels = @group.channels
      render json: @channels
    end

    def show
      @channel = Channel.find(params[:id])
      render json: @channel, :include => [:sources => {:only => :url} ]
    end

    def create
      @channel = @group.channels.new(channel_params)
      if @channel.save
        render json: @channel, status: :created
      else
        render json: { errors: @channel.errors }, status: :unprocessable_entity
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
    def channel_params
      params.permit(:name)
    end

    def set_group
      @group = LiveGroup.find_by!(id: params[:group_id])
    end

  end
end
