require_dependency "seo/application_controller"

module Seo
  class PermanentRedirectsController < ApplicationController
    # GET /permanent_redirects
    # GET /permanent_redirects.json
    def index
      @permanent_redirects = PermanentRedirect.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @permanent_redirects }
      end
    end
  
    # GET /permanent_redirects/1
    # GET /permanent_redirects/1.json
    def show
      @permanent_redirect = PermanentRedirect.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @permanent_redirect }
      end
    end
  
    # GET /permanent_redirects/new
    # GET /permanent_redirects/new.json
    def new
      @permanent_redirect = PermanentRedirect.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @permanent_redirect }
      end
    end
  
    # GET /permanent_redirects/1/edit
    def edit
      @permanent_redirect = PermanentRedirect.find(params[:id])
    end
  
    # POST /permanent_redirects
    # POST /permanent_redirects.json
    def create
      @permanent_redirect = PermanentRedirect.new(params[:permanent_redirect])
  
      respond_to do |format|
        if @permanent_redirect.save
          format.html { redirect_to @permanent_redirect, notice: 'Permanent redirect was successfully created.' }
          format.json { render json: @permanent_redirect, status: :created, location: @permanent_redirect }
        else
          format.html { render action: "new" }
          format.json { render json: @permanent_redirect.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /permanent_redirects/1
    # PUT /permanent_redirects/1.json
    def update
      @permanent_redirect = PermanentRedirect.find(params[:id])
  
      respond_to do |format|
        if @permanent_redirect.update_attributes(params[:permanent_redirect])
          format.html { redirect_to @permanent_redirect, notice: 'Permanent redirect was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @permanent_redirect.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /permanent_redirects/1
    # DELETE /permanent_redirects/1.json
    def destroy
      @permanent_redirect = PermanentRedirect.find(params[:id])
      @permanent_redirect.destroy
  
      respond_to do |format|
        format.html { redirect_to permanent_redirects_url }
        format.json { head :no_content }
      end
    end
  end
end
