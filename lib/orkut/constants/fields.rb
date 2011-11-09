require 'orkut/constants/params'

module Orkut
  module Constants
    module Fields
      module AclEntryFields
        # Level of access for this entry in the ACL (read/write).
        ACCESS_TYPE = 'accessType'
        ACCESSOR_ID = 'accessorId'
        # The identifier for this ACL entry.
        ACCESSOR_INFO = 'accessorInfo'
        # Specifies the type of user in this entry of the ACL.
        ACCESSOR_TYPE = 'accessorType'
      end
      
      ACTIVITIES = 'activities'
      ACTIVITY = 'activity'
      ACTIVITY_ID = 'activityId'
      ALT = 'alt'
      BIRTHDAY = 'birthday'
      COUNTRY = 'country'
      CURRENT_LOCATION = 'currentLocation'
      LOCALITY = 'locality'
      POSTAL_CODE = 'postal'
      REGION = 'region'
      ABOUT_ME = 'aboutMe'
      # data specifying the ACL for this album
      ACL = 'accessControlList'
      ACTIVITY_TYPE = 'activityType'
      ALBUM_ID = Orkut::Constants::Params::ALBUM_ID
      ALBUM_TITLE = 'albumTitle'
      ALLOW_IM = 'allowIm'
      APP_ID = 'appId'
      AUTHOR_ID = 'authorId'

      BODY = 'body'
      COALESCE = 'coalesce'
      COLLECTION = 'collection'
      COMMENTS = 'comments'
      CONTENT = 'content'
      COUNT = 'count'
      CREATED = 'created'
      DESCRIPTION = 'description'
      DISPLAY_NAME = 'displayName'
      EMAILS = 'emails'
      # The list of entries in an ACL
      ENTRIES = 'entries'
      ERROR_TYPE = 'errorType'
      EXTRA_PARAMS = 'extraParams'
      FIELDS = 'fields'
      FROM_USER_ID = 'fromUserId'
      FROM_USER_PROFILE = 'fromUserProfile'
      GENDER = 'gender'
      GROUP_ID = 'groupId'
      LANGUAGE = 'hl'
      KIND = 'kind'
      ID = 'id'

      # the json field for location
      LOCATION = 'location'
      # the json field for count of media items in album
      MAX_RESULTS = 'maxResults'
      MEDIA_ITEM_COUNT = 'mediaItemCount'
      MEDIA_ITEMS = 'mediaItems'
      # media mime types in the album
      MEDIA_MIME_TYPE = 'mediaMimeType'
      # media types in the album
      MEDIA_TYPE = 'mediaType'
      MESSAGE = 'message'
      MESSAGE_TYPE = 'messageType'
      METHOD = 'method'
      NAME = 'name'
      # The next two are subfields of 'name':
      NAME_FAMILY_NAME = 'familyName'
      NAME_GIVEN_NAME = 'givenName'
      NOTE = 'note'
      PAGE_TOKEN = 'pageToken'
      PAGE_TYPE = 'pageType'
      PAGE_URL = 'pageUrl'
      PARAMS = 'params'
      PERSON = 'person'
      PERSON_ID = 'personId'
      PHONE_NUMBERS = 'phoneNumbers'
      POSTED_TIME = 'postedTime'
      PROFILE_FIELDS = 'profileFields'
      PROFILE_URL = 'profileUrl'
      RELATIONSHIP_STATUS = 'relationshipStatus'
      RELEVANT_PROFILES = 'relevantProfiles'
      RELEVANT_USER_IDS = 'relevantUserIds'
      START_INDEX = 'startIndex'
      STATUS = 'status'
      TEMPLATE_PARAMS = 'templateParams'
      TEXT = 'text'
      # the json field for thumbnail url
      THUMBNAIL_URL = 'thumbnailUrl'
      TIME = 'time'
      TITLE = 'title'
      TOTAL_RESULTS = 'totalResults'
      TYPE = 'type'
      UPDATED_BEFORE = 'updatedBefore'
      URL = 'url'
      USER_ID = 'userId'
      VALUE = 'value'
      YOUTUBE_URL = 'youtubeUrl'
      VIDEO_DURATION = 'durationInSec'
      
      MESSAGE_FORMAT = "messageFormat";
    end
  end
end