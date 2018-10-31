class ChatTemplatesController < ApplicationController
  before_action :find_chat_template, only: [:edit, :update, :destroy]
  def index
    @chat_templates = current_user.chat_templates.all
  end

  def new
    @chat_template = current_user.chat_templates.create()
  end

  def create
    @chat_template = current_user.chat_templates.create(template_params)
    if @chat_template.save
      redirect_to chat_templates_path
    else
      render :new
    end
  end

  def update
    if @chat_template.update(template_params)
      redirect_to chat_templates_path
    else
      render :edit
    end
  end

  def destroy
    @chat_template.destroy if @chat_template
    redirect_to chat_templates_path
  end

  private
  def template_params
    params.require(:chat_template).permit(:content)
  end

  def find_chat_template
    @chat_template = ChatTemplate.find_by(id: params[:id])
  end
end
