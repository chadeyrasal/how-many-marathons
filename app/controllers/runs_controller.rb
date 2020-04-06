class RunsController < ApplicationController

    before_action :redirect_unless_logged_in, only: [:index, new]

    def index
        @runs = current_user.runs
    end

    def new
        @run = Run.new
    end

    def create
        @run = current_user.runs.new(run_params)
        if @run.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    private

    def run_params
        params.require(:run).permit(:date, :distance)
    end
    
end