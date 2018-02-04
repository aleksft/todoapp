class ListsController < ApplicationController
  before_action :set_list, only: [:show, :show_shared_list, :show_all_list, :edit, :update, :destroy]
  before_action :set_elements, only: [:show, :show_shared_list, :show_all_list]

  # GET /lists
  # GET /lists.json
  def index
    @type_view = 'index'
    @lists = List.where('lists.user_id = ?', current_user.id)
  end

  def shared_lists
    @type_view = 'shared'
    @lists = List.where('lists.user_id = ?', current_user.id)

    render 'index'
  end

  def all_lists
    @type_view = 'all'
    @lists = List.where('lists.user_id = ?', current_user.id)

    render 'index'
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @type_view = 'mine'
  end

  def show_shared_list
    @type_view = 'shared'

    render 'show'
  end

  def show_all_list
    @type_view = 'all'

    render 'show'
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    def set_elements
      @elements = @list.elements
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title, :description)
    end
end
