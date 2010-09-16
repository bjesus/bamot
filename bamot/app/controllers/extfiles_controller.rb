class ExtfilesController < ApplicationController
  # GET /extfiles
  # GET /extfiles.xml
  def index
    @extfiles = Extfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @extfiles }
    end
  end

  # GET /extfiles/1
  # GET /extfiles/1.xml
  def show
    @extfile = Extfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @extfile }
    end
  end

  # GET /extfiles/new
  # GET /extfiles/new.xml
  def new
    @extfile = Extfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @extfile }
    end
  end

  # GET /extfiles/1/edit
  def edit
    @extfile = Extfile.find(params[:id])
  end

  # POST /extfiles
  # POST /extfiles.xml
  def create
    @extfile = Extfile.new(params[:extfile])

    respond_to do |format|
      if @extfile.save
        format.html { redirect_to(@extfile, :notice => 'Extfile was successfully created.') }
        format.xml  { render :xml => @extfile, :status => :created, :location => @extfile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @extfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /extfiles/1
  # PUT /extfiles/1.xml
  def update
    @extfile = Extfile.find(params[:id])

    respond_to do |format|
      if @extfile.update_attributes(params[:extfile])
        format.html { redirect_to(@extfile, :notice => 'Extfile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @extfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /extfiles/1
  # DELETE /extfiles/1.xml
  def destroy
    @extfile = Extfile.find(params[:id])
    @extfile.destroy

    respond_to do |format|
      format.html { redirect_to(extfiles_url) }
      format.xml  { head :ok }
    end
  end
end
