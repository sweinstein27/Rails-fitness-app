class ActivityDatumController < ApplicationController

    def show
       @activity_data = ActivityDatum.find_by(id: params[:id])
    end

end