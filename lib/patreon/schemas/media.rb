# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module Media
      Name = 'media'

      class Attributes
        include Utils::Enum

        define :FILE_NAME, 'file_name'
        define :SIZE_BYTES, 'size_bytes'
        define :MIMETYPE, 'mimetype'
        define :STATE, 'state'
        define :OWNER_TYPE, 'owner_type'
        define :OWNER_ID, 'owner_id'
        define :OWNER_RELATIONSHIP, 'owner_relationship'
        define :UPLOAD_EXPIRES_AT, 'upload_expires_at'
        define :UPLOAD_URL, 'upload_url'
        define :UPLOAD_PARAMETERS, 'upload_parameters'
        define :DOWNLOAD_URL, 'download_url'
        define :IMAGE_URLS, 'image_urls'
        define :CREATED_AT, 'created_at'
        define :METADATA, 'metadata'
      end

    end
  end
end