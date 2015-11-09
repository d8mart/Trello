class HomeworksController < ApplicationController
  before_filter :get_users
  before_action :set_homework, only: [:show, :edit, :update, :destroy]

  # GET /homeworks
  # GET /homeworks.json
  def index
   # @homeworks = Homework.all
    @homeworks = Homework.order(end_date: :asc).where(status:false)
     @homeworks2 = Homework.order(end_date: :asc).where(status:true)
     
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
    
  end

  # GET /homeworks/new
  def new
      @homework = Homework.new
    if user_signed_in?
     @homework = Homework.new
    else
      redirect_to homeworks_path  
      flash.alert = "You must be logged in"
    
    end
  
    
  end

  # GET /homeworks/1/edit
  def edit
    if user_signed_in?
     
    else
      redirect_to homeworks_path
       flash.alert = "You must be logged in"
    end
  end

  # POST /homeworks
  # POST /homeworks.json
  def create
   # @homework = Homework.new(homework_params)
   @homework = current_user.homeworks.new(homework_params)
    respond_to do |format|
      if @homework.save
        format.html { redirect_to @homework, notice: 'Homework was successfully created.' }
        format.json { render :show, status: :created, location: @homework }
      else
        format.html { render :new }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    respond_to do |format|
      if @homework.update(homework_params)
        format.html { redirect_to @homework, notice: 'Homework was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework }
      else
        format.html { render :edit }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy

    
    if user_signed_in?
         @homework.destroy
     respond_to do |format|
      format.html { redirect_to homeworks_url, notice: 'Homework was successfully destroyed.' }
      format.json { head :no_content }
     end
    else
      redirect_to homeworks_path
       flash.alert = "You must be logged in"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homework_params
      params.require(:homework).permit(:title, :description, :duration, :start_date, :end_date, :user_id, :status)
     
    end
    
    private
  def get_users
   @users = User.all.map {|user| [user.username,user.id]}
   # @users ||= User.find(self.id)
  end
end
