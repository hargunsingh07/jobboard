class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @job_listings = @company.job_listings
end
