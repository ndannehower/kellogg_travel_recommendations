class YearsController < ApplicationController
  def index
    @q = Year.ransack(params[:q])
    @years = @q.result(:distinct => true).includes(:recommendations, :trips).page(params[:page]).per(10)

    render("years/index.html.erb")
  end

  def show
    @trip = Trip.new
    @recommendation = Recommendation.new
    @year = Year.find(params[:id])

    render("years/show.html.erb")
  end

  def new
    @year = Year.new

    render("years/new.html.erb")
  end

  def create
    @year = Year.new

    @year.year = params[:year]

    save_status = @year.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/years/new", "/create_year"
        redirect_to("/years")
      else
        redirect_back(:fallback_location => "/", :notice => "Year created successfully.")
      end
    else
      render("years/new.html.erb")
    end
  end

  def edit
    @year = Year.find(params[:id])

    render("years/edit.html.erb")
  end

  def update
    @year = Year.find(params[:id])

    @year.year = params[:year]

    save_status = @year.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/years/#{@year.id}/edit", "/update_year"
        redirect_to("/years/#{@year.id}", :notice => "Year updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Year updated successfully.")
      end
    else
      render("years/edit.html.erb")
    end
  end

  def destroy
    @year = Year.find(params[:id])

    @year.destroy

    if URI(request.referer).path == "/years/#{@year.id}"
      redirect_to("/", :notice => "Year deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Year deleted.")
    end
  end
end
