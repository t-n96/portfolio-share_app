FactoryBot.define do
  factory :post do
    title { "test-title" }
    introduction { "test-text" }
    post_image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/images/test.jpg")) }
    association :user
  end
end
