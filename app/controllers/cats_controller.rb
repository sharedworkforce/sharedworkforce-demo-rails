class CatsController < ApplicationController
  # GET /cats
  # GET /cats.json
  def index
    @cats = Cat.scoped.order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cats }
    end
  end

  # GET /cats/1
  # GET /cats/1.json
  def show
    @cat = Cat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cat }
    end
  end

  # GET /cats/new
  # GET /cats/new.json
  def new
    @cat = Cat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cat }
    end
  end

  # POST /cats
  # POST /cats.json
  def create
    @cat = Cat.new(params[:cat])

    respond_to do |format|
      if @cat.save
        format.html { redirect_to @cat, notice: 'Cat was successfully created.' }
        format.json { render json: @cat, status: :created, location: @cat }
      else
        format.html { render action: "new" }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cats/1
  # PUT /cats/1.json
  def update
    @cat = Cat.find(params[:id])

    respond_to do |format|
      if @cat.update_attributes(params[:cat])
        format.html { redirect_to @cat, notice: 'Cat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  def approved
    @cats = Cat.scoped.order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cats }
    end
  end

  def pending
    @cats = Cat.scoped.order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cats }
    end
  end

  def rejected
    @cats = Cat.scoped.order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cats }
    end
  end

  def eyes
    @cats = Cat.scoped.order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cats }
    end
  end
end
