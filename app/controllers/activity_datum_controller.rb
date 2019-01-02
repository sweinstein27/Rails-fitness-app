class ActivityDatumController < ApplicationController

    def show
       @activity_data = ActivityDatum.find_by(id: params[:id])
       respond_to do |format|
        format.html { render :show }
        format.json do
          render json: @activity_data
        end
      end
    end

end