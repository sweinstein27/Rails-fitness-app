class ActivityDatumController < ApplicationController

    def show
       @activity_data = ActivityDatum.find_by(id: params[:id])
    end

    def data
        @activity_data = ActivityDatum.find_by(id: params[:id])
        render json: @activity_data, status: 201
    end

end