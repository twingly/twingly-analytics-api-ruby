# encoding: utf-8

require 'date'

module Twingly
  module LiveFeed

    # A blog post
    #
    # @attr_reader [String] id the post ID (Twingly internal identification)
    # @attr_reader [String] author the author of the blog post
    # @attr_reader [String] url the post URL
    # @attr_reader [String] title the post title
    # @attr_reader [String] text the blog post text
    # @attr_reader [String] language_code ISO two letter language code for the
    #   language that the post was written in
    # @attr_reader [String] location_code ISO two letter language code for the
    #   location of the blog
    # @attr_reader [Hash] coordinates a hash containing :latitude and :longitude
    #   from the post RSS
    # @attr_reader [Array] links all links from the blog post to other resources
    # @attr_reader [Array] tags the post tags/categories
    # @attr_reader [Array] images image URLs from the post (currently not populated)
    # @attr_reader [Time] indexed the time, in UTC, when the post was indexed by Twingly
    # @attr_reader [Time] published the time, in UTC, when the post was published
    # @attr_reader [Time] reindexed timestamp when the post last was changed in our database/index
    # @attr_reader [String] inlinks_count number of links to this post that was found in other blog posts
    # @attr_reader [String] blog_id the blog ID (Twingly internal identification)
    # @attr_reader [String] blog_name the name of the blog
    # @attr_reader [String] blog_url the blog URL
    # @attr_reader [Integer] blog_rank the rank of the blog, based on authority and language
    #   See https://developer.twingly.com/resources/ranking/#blogrank
    # @attr_reader [] authority the blog's authority/influence
    #   See https://developer.twingly.com/resources/ranking/#authority
    class Post
      attr_reader :id, :author, :url, :title, :text, :language_code,
        :language_code, :coordinates, :links, :tags, :images, :indexed,
        :published, :reindexed, :inlinks_count, :blog_id, :blog_name,
        :blog_url, :blog_rank, :authority

      # Sets all instance variables for the {Post}, given a Hash.
      #
      # @param [Hash] params containing blog post data.
      def set_values(params)
        @id            = params.fetch('id')
        @author        = params.fetch('author')
        @url           = params.fetch('url')
        @title         = params.fetch('title')
        @text          = params.fetch('text')
        @language_code = params.fetch('languageCode')
        @location_code = params.fetch('locationCode')
        @coordinates   = params.fetch('coordinates', {})
        @links         = params.fetch('links', [])
        @tags          = params.fetch('tags', [])
        @images        = params.fetch('images', [])
        @indexed       = Time.parse(params.fetch('indexed'))
        @published     = Time.parse(params.fetch('published'))
        @reindexed     = Time.parse(params.fetch('reindexed'))
        @inlinks_count = params.fetch('inlinksCount').to_i
        @blog_id       = params.fetch('blogId')
        @blog_name     = params.fetch('blogName')
        @blog_url      = params.fetch('blogUrl')
        @blog_rank     = params.fetch('blogRank').to_i
        @authority     = params.fetch('authority').to_i
      end
    end
  end
end