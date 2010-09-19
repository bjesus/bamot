# coding: utf-8

class CreationsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :fetch_post, :only => [:edit, :update, :destroy]
  before_filter :authorise, :only => [:edit, :update, :destroy]
  before_filter :admin, :only => [:index]
  before_filter :set_locale

  # GET /creations
  # GET /creations.xml
  def index
    @creations = Creation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @creations }
    end
  end

  # GET /creations/1
  # GET /creations/1.xml
  def show
    @creation = Creation.find(params[:id])
    @creations = Creation.order("created_at DESC").limit(5)
    rids = Creation.find( :all, :select => 'id' ).map( &:id )
    @random = Creation.find( (1..5).map { rids.delete_at( rids.size * rand ) } )
    @users = User.order("created_at DESC").limit(4)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @creation }
    end
  end

  # GET /creations/new
  # GET /creations/new.xml
  def new
    @creation = Creation.new
    @topics = Topic.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @creation }
    end
  end

  # GET /creations/1/edit
  def edit
    @creation = Creation.find(params[:id])
  end

  # POST /creations
  # POST /creations.xml
  def create
    @creation = current_user.creations.build(params[:creation])

    respond_to do |format|
      if @creation.save
        format.html { redirect_to(@creation, :notice => "היצירה שלכם נוספה לאתר. ממבט ראשון היא נראית נהדרת!") }
        format.xml  { render :xml => @creation, :status => :created, :location => @creation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @creation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /creations/1
  # PUT /creations/1.xml
  def update
    @creation = Creation.find(params[:id])
    respond_to do |format|
      if @creation.update_attributes(params[:creation])
        format.html { redirect_to(@creation, :notice => 'היצירה שלכם עודכנה. יופי') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @creation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /creations/1
  # DELETE /creations/1.xml
  def destroy
    @creation = Creation.find(params[:id])
    @creation.destroy

    respond_to do |format|
      format.html { redirect_to("/", :notice => "לא יודע למה החלטתם לעשות את זה, אבל שתדעו שהיצירה שלכם נמחקה מהאתר...") }
      format.xml  { head :ok }
    end
  end

  def fetch_post
    @post = Creation.find(params[:id])
  end

end
