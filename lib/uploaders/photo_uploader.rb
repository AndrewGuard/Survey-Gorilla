class PhotoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    'images'
  end
end