class ConnectionsController < ApplicationController
  def index
    @connections = Connection.all.sort_by{|e| e[:first_name]}

    render("connections/index.html.erb")
  end

  def show
    @connection = Connection.find(params[:id])

    render("connections/show.html.erb")
  end

  def new
    @connection = Connection.new

    render("connections/new.html.erb")
  end

  def create
    @connection = Connection.new

    @connection.first_name = params[:first_name]
    @connection.last_name = params[:last_name]
    @connection.company = params[:company]
    @connection.phone = params[:phone]
    @connection.email = params[:email]
    @connection.birthdate = params[:birthdate]
    @connection.linkedin = params[:linkedin]
    @connection.user_id = params[:user_id]

    save_status = @connection.save

    if save_status == true
      redirect_to("/connections/#{@connection.id}", :notice => "Connection created successfully.")
    else
      render("connections/new.html.erb")
    end
  end

  def edit
    @connection = Connection.find(params[:id])

    render("connections/edit.html.erb")
  end

  def update
    @connection = Connection.find(params[:id])

    @connection.first_name = params[:first_name]
    @connection.last_name = params[:last_name]
    @connection.company = params[:company]
    @connection.phone = params[:phone]
    @connection.email = params[:email]
    @connection.birthdate = params[:birthdate]
    @connection.linkedin = params[:linkedin]
    @connection.user_id = params[:user_id]

    save_status = @connection.save

    if save_status == true
      redirect_to("/connections/#{@connection.id}", :notice => "Connection updated successfully.")
    else
      render("connections/edit.html.erb")
    end
  end

  def destroy
    @connection = Connection.find(params[:id])

    @connection.destroy

    if URI(request.referer).path == "/connections/#{@connection.id}"
      redirect_to("/", :notice => "Connection deleted.")
    else
      redirect_to(:back, :notice => "Connection deleted.")
    end
  end
end
