class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params.require(:person).permit(:first_name, :last_name, :title))
    if @person.save
      redirect_to root_path, notice: "Person was created!"
    else
      render :new
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update
      redirect_to persons_path
    else
      render :edit
    end
  end

  def destroy
    @person = Person.find(params[:id])
    if @person.destroy
      redirect_to persons_path
    end
  end

end
