class DepartmentsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @department_pages, @departments = paginate :departments, :per_page => 10
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @locations= Location.find(:all)
    if @locations.size == 0
      flash[:notice] = "You should create a location first!"
      redirect_to :action=>'new', :controller=>'locations'
    else
      @department = Department.new
    end
  end

  def create
    @department = Department.new(params[:department])
    if @department.save
      flash[:notice] = 'Department was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update_attributes(params[:department])
      flash[:notice] = 'Department was successfully updated.'
      redirect_to :action => 'show', :id => @department
    else
      render :action => 'edit'
    end
  end

  def destroy
    Department.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
