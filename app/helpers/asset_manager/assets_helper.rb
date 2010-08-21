module AssetManager::AssetsHelper
  def s3_authenticated_url(asset, style, expires=10.seconds)
    AWS::S3::S3Object.url_for(asset.data.path(style), asset.data.bucket_name, :expires_in => expires)
  end
end
