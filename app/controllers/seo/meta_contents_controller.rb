require_dependency "seo/application_controller"

module Seo
  class MetaContentsController < ApplicationController
    # GET /meta_contents
    # GET /meta_contents.json
    def index
      @meta_contents = MetaContent.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @meta_contents }
      end
    end
  
    # GET /meta_contents/1
    # GET /meta_contents/1.json
    def show
      @meta_content = MetaContent.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @meta_content }
      end
    end
  
    # GET /meta_contents/new
    # GET /meta_contents/new.json
    def new
      @meta_content = MetaContent.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @meta_content }
      end
    end
  
    # GET /meta_contents/1/edit
    def edit
      @meta_content = MetaContent.find(params[:id])
    end
  
    # POST /meta_contents
    # POST /meta_contents.json
    def create
      @meta_content = MetaContent.new(params[:meta_content])
  
      respond_to do |format|
        if @meta_content.save
          format.html { redirect_to @meta_content, notice: 'Meta content was successfully created.' }
          format.json { render json: @meta_content, status: :created, location: @meta_content }
        else
          format.html { render action: "new" }
          format.json { render json: @meta_content.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /meta_contents/1
    # PUT /meta_contents/1.json
    def update
      @meta_content = MetaContent.find(params[:id])
  
      respond_to do |format|
        if @meta_content.update_attributes(params[:meta_content])
          format.html { redirect_to @meta_content, notice: 'Meta content was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @meta_content.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /meta_contents/1
    # DELETE /meta_contents/1.json
    def destroy
      @meta_content = MetaContent.find(params[:id])
      @meta_content.destroy
  
      respond_to do |format|
        format.html { redirect_to meta_contents_url }
        format.json { head :no_content }
      end
    end
  end
end
