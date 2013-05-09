module Esbit
  class Campfire
    attr_reader :subdomain, :token, :connection

    def initialize(subdomain, token)
      @subdomain = subdomain
      @token = token
      @connection = Esbit::Connection.new(self)
    end

    def rooms
      @rooms ||= @connection.get('rooms')['rooms'].collect { |room_json|
        Room.new(room_json, @connection)
      }
    end

    def room(room_id)
      @connection.get 'rooms', id: room_id
    end

    def find_room_by_id(room_id)
      self.rooms.find { |room| room.id == room_id }
    end

    def find_room_by_name(room_name)
      self.rooms.find { |room| room.name == room_name }
    end
  end
end
