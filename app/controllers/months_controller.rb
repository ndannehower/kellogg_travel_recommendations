class MonthsController < ApplicationController
  def index
    @q = Month.ransack(params[:q])
    @months = @q.result(:distinct => true).includes(:recommendations).page(params[:page]).per(10)

    render("months/index.html.erb")
  end

  def show
    @recommendation = Recommendation.new
    @month = Month.find(params[:id])

    render("months/show.html.erb")
  end

  def new
    @month = Month.new

    render("months/new.html.erb")
  end

  def create
    @month = Month.new

    @month.month = params[:month]

    save_status = @month.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/months/new", "/create_month"
        redirect_to("/months")
      else
        redirect_back(:fallback_location => "/", :notice => "Month created successfully.")
      end
    else
      render("months/new.html.erb")
    end
  end

  def edit
    @month = Month.find(params[:id])

    render("months/edit.html.erb")
  end

  def update
    @month = Month.find(params[:id])

    @month.month = params[:month]

    save_status = @month.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/months/#{@month.id}/edit", "/update_month"
        redirect_to("/months/#{@month.id}", :notice => "Month updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Month updated successfully.")
      end
    else
      render("months/edit.html.erb")
    end
  end

  def destroy
    @month = Month.find(params[:id])

    @month.destroy

    if URI(request.referer).path == "/months/#{@month.id}"
      redirect_to("/", :notice => "Month deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Month deleted.")
    end
  end
end
