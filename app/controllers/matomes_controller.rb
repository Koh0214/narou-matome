class MatomesController < ApplicationController
  before_action :set_matome, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :destroy]

  # GET /matomes
  # GET /matomes.json
  def index
    @matomes = Matome.order("id desc")
  end

  # GET /matomes/1
  # GET /matomes/1.json
  def show
    @matome = Matome.where(:id => params[:id]).first
    impressionist(@matome, nil, unique: [:session_hash])
    @novels = @matome.novels.all
    @novel = Novel.new
  end

  # GET /matomes/new
  def new
    @matome = Matome.new
    @user = current_user
  end

  # GET /matomes/1/edit
  def edit
  end

  # POST /matomes
  # POST /matomes.json
  def create
    @matome = Matome.new(matome_params)

    respond_to do |format|
      if @matome.save
        format.html { redirect_to root_path, notice: 'Matome was successfully created.' }
        format.json { render :show, status: :created, location: @matome }
      else
        format.html { render :new }
        format.json { render json: @matome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matomes/1
  # PATCH/PUT /matomes/1.json
  def update
    respond_to do |format|
      if @matome.update(matome_params)
        format.html { redirect_to @matome, notice: 'Matome was successfully updated.' }
        format.json { render :show, status: :ok, location: @matome }
      else
        format.html { render :edit }
        format.json { render json: @matome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matomes/1
  # DELETE /matomes/1.json
  def destroy
    @matome.destroy
    respond_to do |format|
      format.html { redirect_to matomes_url, notice: 'Matome was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def get_novel_info

    # 参考URL https://qiita.com/awakia/items/bd8c1385115df27c15fa
    # TODO APIが死んだ時とかに、単純に500が返ってきて、javascriptエラーになるけどそれで良いのかな？
    novel_code = params[:url].gsub("https://ncode.syosetu.com/", "").gsub("http://ncode.syosetu.com/", "").gsub("/", "")
    request_url = "https://api.syosetu.com/novelapi/api/?out=json&of=t-s-w&ncode=" + novel_code

    api_response = Net::HTTP.get(URI.parse(request_url))
    novel_info = JSON.parse(api_response)

    # 入力されたURLが対応したURLだった場合、allcount(取得小説数)が1となる
    # そうじゃない場合はnullを入れて、javascriptの方でエラーを出す。TODO ここでのnullはundefinedになっているが、結果的に望む動作をしている。
    if novel_info[0]["allcount"] == 1
      @novel_title = novel_info[1]["title"]
      @novel_description = novel_info[1]["story"]
    else
      @novel_title = null
      @novel_description = null
    end


    # TODO ハーメルンとかをMechanizeでスクレイピングする場合を入れる
    # 暫定的にハーメルンから取得してみたけど、クラスssがたくさんありすぎて大量に取得する状態になっている。
    # harmeln_url = "https://syosetu.org/novel/145355/"
    # agent = Mechanize.new
    # agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # page = agent.get(harmeln_url)
    # @novel_title = page.at('title').inner_text
    # @novel_description = page.search('.ss.ss').inner_text
    #
    # respond_to do |format|
    #   format.js
    # end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matome
      @matome = Matome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matome_params
      params.require(:matome).permit(:title, :description, :like, :user_id)
    end
end
