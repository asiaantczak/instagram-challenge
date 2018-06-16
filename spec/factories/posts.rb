FactoryBot.define do
  factory :post do
    description "My Picture"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/mum.jpeg', 'image/jpeg')
    user { User.first || association(:user) }
  end
end
