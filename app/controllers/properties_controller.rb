class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    render :index
  end

  def show
    @property = Property.find_by(id: params[:id])
    render :show
  end

  def create
    @property = Property.create(
      address: params[:address],
      notes: params[:notes],
      purchase_price: params[:purchase_price],
      interest_rate: params[:interest_rate],
      amortization: params[:amortization],
      down_payment: params[:down_payment],
      loan_amount: params[:loan_amount],
      monthly_payment: params[:monthly_payment],
      property_tax: params[:property_tax],
      monthly_income: params[:monthly_income]
    )
    render :show
  end
end
