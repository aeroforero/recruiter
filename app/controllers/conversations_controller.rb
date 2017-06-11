class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all

    render("conversations/index.html.erb")
  end

  def show
    @conversation = Conversation.find(params[:id])

    render("conversations/show.html.erb")
  end

  def new
    @conversation = Conversation.new

    render("conversations/new.html.erb")
  end

  def create
    @conversation = Conversation.new

    @conversation.date = params[:date]
    @conversation.summary = params[:summary]
    @conversation.full_detail = params[:full_detail]
    @conversation.location = params[:location]
    @conversation.connections_id = params[:connections_id]

    save_status = @conversation.save

    if save_status == true
      redirect_to("/connections/#{@conversation.connections_id}", :notice => "Conversation created successfully.")
    else
      render("conversations/new.html.erb")
    end
  end

  def edit
    @conversation = Conversation.find(params[:id])

    render("conversations/edit.html.erb")
  end

  def update
    @conversation = Conversation.find(params[:id])

    @conversation.date = params[:date]
    @conversation.summary = params[:summary]
    @conversation.full_detail = params[:full_detail]
    @conversation.location = params[:location]
    @conversation.connections_id = params[:connections_id]

    save_status = @conversation.save

    if save_status == true
      redirect_to("/conversations/#{@conversation.id}", :notice => "Conversation updated successfully.")
    else
      render("conversations/edit.html.erb")
    end
  end

  def destroy
    @conversation = Conversation.find(params[:id])

    @conversation.destroy

    if URI(request.referer).path == "/conversations/#{@conversation.id}"
      redirect_to("/", :notice => "Conversation deleted.")
    else
      redirect_to(:back, :notice => "Conversation deleted.")
    end
  end
end
