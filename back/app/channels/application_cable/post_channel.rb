# class PostChannel < ApplicationCable::Channel
#   def subscribed
#     stream_from 'post:message'
#   end

#   def unsubscribed
#   end

#   def post(data)
#     PostChannel.broadcast_to('message', data['message'])
#   end
# end