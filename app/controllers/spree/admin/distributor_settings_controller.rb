class Spree::Admin::DistributorSettingsController < Spree::Admin::BaseController
before_action :set_distributor_setting, only: [:show, :edit, :update, :destroy]

  # GET /distributor_settings
  # GET /distributor_settings.json
  def index
    @distributor_settings = DistributorSetting.all
  end

  # GET /distributor_settings/1
  # GET /distributor_settings/1.json
  def show
  end

  # GET /distributor_settings/new
  def new
    @distributor_setting = DistributorSetting.new
  end

  # GET /distributor_settings/1/edit
  def edit
  end

  # POST /distributor_settings
  # POST /distributor_settings.json
  def create
    @distributor_setting = DistributorSetting.new(distributor_setting_params)

    respond_to do |format|
      if @distributor_setting.save
        format.html { redirect_to admin_distributor_settings_path, notice: 'Distributor setting was successfully created.' }
        format.json { render :show, status: :created, location: @distributor_setting }
      else
        format.html { render :new }
        format.json { render json: @distributor_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /distributor_settings/1
  # PATCH/PUT /distributor_settings/1.json
  def update
    respond_to do |format|
      if @distributor_setting.update(distributor_setting_params)
        format.html { redirect_to @distributor_setting, notice: 'Distributor setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @distributor_setting }
      else
        format.html { render :edit }
        format.json { render json: @distributor_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distributor_settings/1
  # DELETE /distributor_settings/1.json
  def destroy
    @distributor_setting.destroy
    respond_to do |format|
      format.html { redirect_to distributor_settings_url, notice: 'Distributor setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distributor_setting
      @distributor_setting = DistributorSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def distributor_setting_params
      params.permit(:margin_value, :margin_percentage, :margin_min, :margin_max, :order_cut_off, :file_check_time)
    end
end
