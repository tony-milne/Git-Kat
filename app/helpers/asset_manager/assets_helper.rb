module AssetManager::AssetsHelper
  # Helper generates authenticated URL for sending requests to S3 to download
  # assets.
  def s3_authenticated_url(asset, style, expires=10.seconds, ssl=false)
    AWS::S3::S3Object.url_for(asset.data.path(style), asset.data.bucket_name, :expires_in => expires, :use_ssl => ssl)
  end
end
