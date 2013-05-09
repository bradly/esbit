module Esbit
  class Room
    attr_reader :id, :name, :connection

    def initialize(room_json, connection)
      @id = room_json["id"]
      @name = room_json["name"]
      @connection = connection
    end

    def say(message)
      json_message = {message: {type: 'TextMessage', body: message}}
      @connection.post "/room/#{@id}/speak", json_message(message)
    end
  end
end
