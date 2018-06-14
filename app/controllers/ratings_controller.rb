class RatingsController < ApplicationController
  def index
    @q = Rating.ransack(params[:q])
    @ratings = @q.result(:distinct => true).includes(:recommendations).page(params[:page]).per(10)

    render("ratings/index.html.erb")
  end

  def show
    @recommendation = Recommendation.new
    @rating = Rating.find(params[:id])

    render("ratings/show.html.erb")
  end

  def new
    @rating = Rating.new

    render("ratings/new.html.erb")
  end

  def create
    @rating = Rating.new

    @rating.rating = params[:rating]

    save_status = @rating.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ratings/new", "/create_rating"
        redirect_to("/ratings")
      else
        redirect_back(:fallback_location => "/", :notice => "Rating created successfully.")
      end
    else
      render("ratings/new.html.erb")
    end
  end

  def edit
    @rating = Rating.find(params[:id])

    render("ratings/edit.html.erb")
  end

  def update
    @rating = Rating.find(params[:id])

    @rating.rating = params[:rating]

    save_status = @rating.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ratings/#{@rating.id}/edit", "/update_rating"
        redirect_to("/ratings/#{@rating.id}", :notice => "Rating updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Rating updated successfully.")
      end
    else
      render("ratings/edit.html.erb")
    end
  end

  def destroy
    @rating = Rating.find(params[:id])

    @rating.destroy

    if URI(request.referer).path == "/ratings/#{@rating.id}"
      redirect_to("/", :notice => "Rating deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Rating deleted.")
    end
  end
end
