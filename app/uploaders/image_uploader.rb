class ImageUploader < CarrierWave::Uploader::Base
    
    storage :fog

    def store_dir
      'images'
    end

    def filename
      if original_filename
        @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
        "#{@name}.#{file.extension}"
      end
    end
end