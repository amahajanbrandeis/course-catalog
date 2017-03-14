class Instructor < ApplicationRecord
=begin
      def self.save_data_from_api
        file = File.read('course.json')
        course_hash = JSON.parse(file)

        response = HTTParty.get('URI')
        user_data = JSON.parse(response)
        users = user_data.map do |line|
          u = User.new
          u.external_id = line['user']['id']
          # set name value however you want to do that
          u.save
          u
        end
      users.select(&:persisted?)
    end
=end
  #comment
end
