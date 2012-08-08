class WorkoutsController < ApplicationController
  before_filter :authenticate_user!


  # GET /workouts
  # GET /workouts.json
  def index
    @workouts = current_user.workouts

    if @workouts
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workouts }
    end
  end
end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
    @workout = current_user.workouts.find_by_id(params[:id])

    if @workout 
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workout }
    end
  else
    redirect_to workouts_url
  end
end

  # GET /workouts/new
  # GET /workouts/new.json
  def new
    @workout = current_user.workouts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout }
    end
  end

  # GET /workouts/1/edit
  def edit
    @workout = current_user.workouts.find_by_id(params[:id])

    if @workout.nil?  
      redirect_to workouts_url 
    else @workout 
    end
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = current_user.workouts.create(params[:workout])

    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render json: @workout, status: :created, location: @workout }
      else
        format.html { render action: "new" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workouts/1
  # PUT /workouts/1.json
  def update
    @workout = current_user.workouts.find(params[:id])

    respond_to do |format|
      if @workout.update_attributes(params[:workout])
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout = current_user.workouts.find(params[:id])
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url }
      format.json { head :no_content }
    end
  end
end
