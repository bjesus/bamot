class GarinsController < ApplicationController

  before_filter :admin, :except => [:index, :show]

  # GET /garins
  # GET /garins.xml
  def index
    @garins = Garin.all
    puts cookies
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @garins }
    end
  end

  # GET /garins/1
  # GET /garins/1.xml
  def show
    @garin = Garin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @garin }
    end
  end

  # GET /garins/new
  # GET /garins/new.xml
  def new
    @garin = Garin.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @garin }
    end
  end

  # GET /garins/1/edit
  def edit
    @garin = Garin.find(params[:id])
  end

  # POST /garins
  # POST /garins.xml
  def create
    @garin = Garin.new(params[:garin])

    respond_to do |format|
      if @garin.save
        format.html { redirect_to(@garin, :notice => 'Garin was successfully created.') }
        format.xml  { render :xml => @garin, :status => :created, :location => @garin }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @garin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /garins/1
  # PUT /garins/1.xml
  def update
    @garin = Garin.find(params[:id])

    respond_to do |format|
      if @garin.update_attributes(params[:garin])
        format.html { redirect_to(@garin, :notice => 'Garin was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @garin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /garins/1
  # DELETE /garins/1.xml
  def destroy
    @garin = Garin.find(params[:id])
    @garin.destroy

    respond_to do |format|
      format.html { redirect_to(garins_url) }
      format.xml  { head :ok }
    end
  end
end
