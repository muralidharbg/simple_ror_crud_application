class TerminalsController < ApplicationController
  # protect_from_forgery with: :null_session
  def index
    @terminals = Terminal.all
    
    respond_to do |format|
      format.json {render :json=> @terminals}
      format.xml {render :xml => @terminals}
    end
  end
  
  def show
    begin
      @terminal = Terminal.find(params[:id])
      
      if @terminal.present? 
        respond_to do |format|
          format.json {render :json=> @terminal}
          format.xml {render :xml => @terminal}
        end
        
      else
        head 404
      end
      
    rescue ActiveRecord::RecordNotFound => e 
      head 404
    end
    
  end
  
  def update
    @terminal = Terminal.find(params[:id])
#     check if  attributes is of type json
    if @terminal.update_attributes(terminal_params)
      response_data = {"message" => "terminal updated successfully"}
      respond_to do |format|
        format.json {render :json=> response_data}
        format.xml {render :xml => response_data}
      end
    else
      head 400
    end
  end
  
  def create
    terminal_request_params = terminal_params
    if terminal_request_params
      @terminal = Terminal.new(terminal_params)
      if @terminal.save
        response_data = {"message" => "terminal added successfully"}
        respond_to do |format|
          format.json {render :json=> response_data}
          format.xml {render :xml => response_data}
        end
      else
        head 500
      end
    else
      head 400
    end  
  end
    
  def destroy
      
      begin
        @terminal = Terminal.find(params[:id])
        if @terminal.destroy
          response_data = {"message" => "terminal deleted successfully"}
          respond_to do |format|
            format.json {render :json=> response_data}
            format.xml {render :xml => response_data}
          end
        else
          head 500    
        end
      rescue ActiveRecord::RecordNotFound => e 
        head 400
      end
  end
  
  private
  def terminal_params
    begin
      additional_info_keys = params[:terminal].try(:fetch, :additional_info, {}).keys
      params.require(:terminal).permit(:name,:description,additional_info: additional_info_keys)
    rescue NoMethodError => e 
      nil
    end
  end
end
