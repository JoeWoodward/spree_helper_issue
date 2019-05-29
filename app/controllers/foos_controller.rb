# frozen_string_literal: true

class FoosController < ApplicationController
  before_action :set_foo, only: %i[show edit update destroy]

  def index
    @foos = Foo.all
  end

  def show; end

  def new
    @foo = Foo.new
  end

  def edit; end

  def create
    @foo = Foo.new(foo_params)

    respond_to do |format|
      if @foo.save
        format.html do
          redirect_to @foo, notice: 'Foo was successfully created.'
        end
        format.json { render :show, status: :created, location: @foo }
      else
        format.html { render :new }
        format.json { render json: @foo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @foo.update(foo_params)
        format.html do
          redirect_to @foo, notice: 'Foo was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @foo }
      else
        format.html { render :edit }
        format.json { render json: @foo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @foo.destroy
    respond_to do |format|
      format.html do
        redirect_to foos_url, notice: 'Foo was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private def set_foo
    @foo = Foo.find(params[:id])
  end

  private def foo_params
    params.fetch(:foo, {})
  end
end
