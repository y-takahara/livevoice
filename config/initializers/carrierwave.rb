require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: "AKIAXS7Q3Y3FN6EH4OGV",
      aws_secret_access_key: "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",
      region: 'ap-northeast-1'  # S3バケット作成時に指定したリージョン。左記は東京を指す
    }
    config.fog_public = false
    config.asset_host = 'https://s3.amazonaws.com/livevoice'
    config.fog_directory  = 'livevoice' # 作成したS3バケット名
  end
  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end