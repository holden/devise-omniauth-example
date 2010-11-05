class MonkeysController < ApplicationController
  # GET /monkeys
  # GET /monkeys.xml
  def index
    @monkeys = Monkey.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @monkeys }
    end
  end

  # GET /monkeys/1
  # GET /monkeys/1.xml
  def show
    @monkey = Monkey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @monkey }
    end
  end

  # GET /monkeys/new
  # GET /monkeys/new.xml
  def new
    @monkey = Monkey.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @monkey }
    end
  end

  # GET /monkeys/1/edit
  def edit
    @monkey = Monkey.find(params[:id])
  end

  # POST /monkeys
  # POST /monkeys.xml
  def create
    @monkey = Monkey.new(params[:monkey])

    respond_to do |format|
      if @monkey.save
        format.html { redirect_to(@monkey, :notice => 'Monkey was successfully created.') }
        format.xml  { render :xml => @monkey, :status => :created, :location => @monkey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @monkey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /monkeys/1
  # PUT /monkeys/1.xml
  def update
    @monkey = Monkey.find(params[:id])

    respond_to do |format|
      if @monkey.update_attributes(params[:monkey])
        format.html { redirect_to(@monkey, :notice => 'Monkey was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @monkey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /monkeys/1
  # DELETE /monkeys/1.xml
  def destroy
    @monkey = Monkey.find(params[:id])
    @monkey.destroy

    respond_to do |format|
      format.html { redirect_to(monkeys_url) }
      format.xml  { head :ok }
    end
  end
end
