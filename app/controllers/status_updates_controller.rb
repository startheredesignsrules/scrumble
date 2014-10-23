class StatusUpdatesController < ApplicationController
  before_action :set_status_update, only: [:show, :edit, :update, :destroy]

  # GET /status_updates
  # GET /status_updates.json
  def index
    @status_updates = StatusUpdate.all
    @status_update = StatusUpdate.new
  end

  # GET /status_updates/1
  # GET /status_updates/1.json
  def show
    @comments = Comment.all
    @current_comments = @comments.select {|comment| comment.status_update_id == @status_update.id}
    @users = User.all
    #author_id = @status_update.user_id # 21
    #puts "Author id: #{author_id}"
    #current_user = User.find_by_id(author_id)
    #puts "Current User Name: #{current_user}"
    @current_user_name = (@users.select {|user| user.id == @status_update.user_id}).map {|userhash| userhash['name']}.join
  end

  # GET /status_updates/new
  def new
    @status_update = StatusUpdate.new
  end

  # GET /status_updates/1/edit
  def edit
  end

  # POST /status_updates
  # POST /status_updates.json
  def create
    @status_update = StatusUpdate.new(status_update_params)

    if @status_update.save
      redirect_to '/home', notice: "You've added your scrum for the day."
    else
      redirect_to 'new', notice: "Something didn't work right."
    end
  end

  # PATCH/PUT /status_updates/1
  # PATCH/PUT /status_updates/1.json
  def update
    respond_to do |format|
      if @status_update.update(status_update_params)
        format.html { redirect_to @status_update, notice: 'Status update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @status_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_updates/1
  # DELETE /status_updates/1.json
  def destroy
    @status_update.destroy
    respond_to do |format|
      format.html { redirect_to status_updates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_update
      @status_update = StatusUpdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_update_params
      params.require(:status_update).permit(:user_id, :done, :doing, :blockers)
    end
end
