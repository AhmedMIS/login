class MessagesController < ApplicationController

	def new
		@message = Message.new
		@user = current_user.following
		@users = User.all
	end

	def create
		@message = current_user.messages.build(message_params)

		if @message.save
			flash[:success] = "Message Sent!"
			redirect_to root_path
		else
			flash[:alert] = "Great Scott!"
			render :new
		end
	end

	def index
	@messages = Recipient.where(:user_id => current_user.id).order("created_at DESC")
  #@messages=Message.where(:sender_id =>current_user.id)


	#@rec=Message.where(:sender_id =>current_user.id)
	#	@recipe=Recipient.where(:user_id =>current_user.id)

@s_messages=Message.where(:sender_id =>current_user.id)

	end

	def new
		@message = Message.new
		@recipients = User.all
	end

	private

		def message_params
			params.require(:message).permit(:body, :content, :title, :thumbnail_url, :sender_id, :reciever_id,user_tokens: [])
		end
end
