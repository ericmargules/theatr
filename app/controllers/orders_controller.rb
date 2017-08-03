class OrdersController < ApplicationController
	before_action :user_admin, except: [:new]
	before_action :set_order, only: [:show, :edit, :update, :destroy]
	
	def index
		@orders = Order.all
	end

	def show
	end

	def new
		@order = Order.new
		@showtime = Showtime.find(params[:showtime]) if params[:showtime]
	end

	def edit
	end

	def create
		@order = Order.new(order_params)

		respond_to do |format|
			if @order.save
				format.html { redirect_to root_path, alert: "Thank you for your order. Your receipt has been emailed to you." }
				format.json { render :show, status: :created, location: @order }
			else
				format.html { render :new }
				format.json { render json: @order.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @order.update(order_params)
				format.html { redirect_to @order, notice: 'Order was successfully updated.' }
				format.json { render :show, status: :ok, location: @order }
			else
				format.html { render :edit }
				format.json { render json: @order.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@order.destroy
		respond_to do |format|
			format.html { redirect_to orders_url, notice: 'Order was removed successfully.' }
			format.json { head :no_content }
		end
	end

	private

    def set_order
      @order = Order.find(params[:id])
	end

	def order_params
		params.require(:order).permit(:showtime_id, :price, :email, :cc_num, :cc_exp)
	end

end
