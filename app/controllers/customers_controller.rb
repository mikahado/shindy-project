class CustomersController < ApplicationController

    before_action :set_customer, only: [:show, :update, :destroy]
    skip_before_action :authorize, only: :count

    def index
      customers = Customer.all
      render json: customers
    end

    def show
      render json: @customer
    end

    def create 
      customer = Customer.create!(customer_params)
      render json: customer
    end

    def update
      customer = @current_user.customers.find_by(id: params[:id])
      if customer
          customer.update(customer_params)
          render json: customer
      else 
          render json: { error: "Customer not found."}, status: :not_found
      end
    end

    def destroy
      if @customer
        @customer.delete
        head :no_content
      else 
        render json: { error: "Not authorized."}, status: :unauthorized
      end
    end

    # def punchcard_length
    #   customers = Customer.joins(:punchcards).group(:id).having('COUNT(punchcards) >= ?', params[:n].to_i)
    #   render json: customers
    # end

    def count
        punchcards = Punchcard.where('count > ?', params[:n])
        
        customers = punchcards.map { |p| p.customer }.uniq

        if customers.present? 
          render json: customers
        else 
          render json: { error: "Punchcard not found"}, status: :not_found
        end
    
    end

    private 

    def customer_params
      params.require(:customer).permit(:username)
    end

    def set_customer
      @customer = @current_user.customers.find_by(id: params[:id])
      render json: { error: "Customer not found" }, status: :not_found unless @customer
    end
    
end