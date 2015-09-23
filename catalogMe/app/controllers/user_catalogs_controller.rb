class UserCatalogsController < ApplicationController
  before_action :set_user_catalog, only: [:show, :edit, :update, :destroy]

  # GET /user_catalogs
  # GET /user_catalogs.json
  def index
    @user_catalogs = UserCatalog.all
  end

  # GET /user_catalogs/1
  # GET /user_catalogs/1.json
  def show
  end

  # GET /user_catalogs/new
  def new
    @user_catalog = UserCatalog.new
  end

  # GET /user_catalogs/1/edit
  def edit
  end

  # POST /user_catalogs
  # POST /user_catalogs.json
  def create
    @user_catalog = UserCatalog.new(user_catalog_params)

    respond_to do |format|
      if @user_catalog.save
        format.html { redirect_to @user_catalog, notice: 'User catalog was successfully created.' }
        format.json { render :show, status: :created, location: @user_catalog }
      else
        format.html { render :new }
        format.json { render json: @user_catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_catalogs/1
  # PATCH/PUT /user_catalogs/1.json
  def update
    respond_to do |format|
      if @user_catalog.update(user_catalog_params)
        format.html { redirect_to @user_catalog, notice: 'User catalog was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_catalog }
      else
        format.html { render :edit }
        format.json { render json: @user_catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_catalogs/1
  # DELETE /user_catalogs/1.json
  def destroy
    @user_catalog.destroy
    respond_to do |format|
      format.html { redirect_to user_catalogs_url, notice: 'User catalog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_catalog
      @user_catalog = UserCatalog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_catalog_params
      params.require(:user_catalog).permit(:username, :firstname, :lastname, :email, :age, :favoritebook)
    end
end
