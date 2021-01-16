class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :delete]
  def index
    @dog_owners_array = Dog.by_owners
  end

  def sorted
    @dog_owners_array = Dog.by_owners.sort_by(&:last).reverse
    render :index
  end

  # def new 
  #   @dog = Dog.new
  # end

  # def create 
  #   @dog = Dog.create(dog_params(:name, :breed, :age))
  #   if @dog.valid?
  #     redirect_to dog_path(@dog)
  #   else
  #     flash[:messages] = @dog.errors
  #     render :new
  #   end
  # end

  def show 
  end

  # def edit
  # end

  # def update
  #   @dog.update(dog_params(:name, :breed, :age))
  #   if @dog.valid?
  #     redirect_to dog_path(@dog)
  #   else
  #     flash[:messages] = @dog.errors
  #     render :edit
  #   end
  # end

  # def destroy 
  #   @dog.destroy
  #   redirect_to dogs_path
  # end

private

def set_dog
  @dog = Dog.find(params[:id])
end

def dog_params(*args)
  params.require(:dog).permit(*args)
end
end
