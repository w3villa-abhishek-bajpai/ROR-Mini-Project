class ContributionsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @contribution = @project.contributions.new
  end

  def create
    @project = Project.find(params[:project_id])
    @contribution = @project.contributions.new(contribution_params)
    Razorpay.setup('rzp_test_KG2jJRr7EKW06N', 'IVqS7aVZ2vW0wLOhcObhsMaj')
  
    if @contribution.valid?
      # 1. Create Razorpay order
      razorpay_order = Razorpay::Order.create(
        amount: (@contribution.amount * 100).to_i, # Amount in paisa
        currency: 'INR',
        receipt: "receipt_#{SecureRandom.hex(10)}",
        payment_capture: 1
      )

      # 2. Save Razorpay order ID to track it later
      @contribution.payment_status = 'created'
      @contribution.payment_id = razorpay_order.id
      @contribution.save!

      # 3. Render Razorpay checkout view
      render :payment, locals: { order_id: razorpay_order.id, contribution: @contribution, project: @project }
    else
      render :new
    end

    def verify_payment
      @payment_id = params[:payment_id]
      @order_id = params[:order_id]
    
      contribution = Contribution.find_by(payment_id: @order_id)
      if contribution
        contribution.payment_status = 'paid'
        contribution.save!
        flash[:notice] = "Thank you! Payment was successful."
      else
        flash[:alert] = "Could not verify payment."
      end
      redirect_to project_path(params[:project_id])
    end
    
  end

  private

  def contribution_params
    params.require(:contribution).permit(:amount, :user_email)
  end
end
