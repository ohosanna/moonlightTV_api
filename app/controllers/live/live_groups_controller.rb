module Live
  class LiveGroupsController < ApplicationController
    def index
      @groups = LiveGroup.all
      render json: @groups
    end

    def create
      @group = LiveGroup.new(group_params)
      if @group.save
        render json: @group, status: :created
      else
        render json: { errors: @group.errors }, status: :unprocessable_entity
      end
    end

    def update
      @group = LiveGroup.find(params[:id])
      if @group.update(group_params)
        render json: @group, status: :created
      else
        render json: { errors: @group.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      @group = LiveGroup.find(params[:id])
      @group.destroy
      head 204
    end

    private
    def group_params
      params.permit(:name)
    end

  end
end
