class JobListingsController < ApplicationController
  def index
    if params[:search].present? && params[:company_id].present?
      @job_listings = JobListing.where('title LIKE ? AND company_id = ?', "%#{params[:search]}%", params[:company_id]).page(params[:page]).per(10)
    elsif params[:search].present?
      @job_listings = JobListing.where('title LIKE ?', "%#{params[:search]}%").page(params[:page]).per(10)
    elsif params[:company_id].present?
      @job_listings = JobListing.where(company_id: params[:company_id]).page(params[:page]).per(10)
    else
      @job_listings = JobListing.all.page(params[:page]).per(10)
    end
  end

  def show
    @job_listing = JobListing.find(params[:id])
  end

  private

  def job_listing_params
    params.require(:job_listing).permit(:title, :description, :company_id)
  end
end
