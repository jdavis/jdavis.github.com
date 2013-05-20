#
# Inspired by: https://github.com/stewart/blog/blob/master/plugins/image_tag.rb
#

module Jekyll
    class ImgTag < Liquid::Tag
        @url = nil
        @caption = nil
        @class = nil

        IMAGE_URL_WITH_CLASS_AND_CAPTION = /(\w+)(\s+)((https?:\/\/|\/)(\S+))(\s+)"(.*?)"/i
        IMAGE_URL_WITH_CAPTION = /((https?:\/\/|\/)(\S+))(\s+)"(.*?)"/i
        IMAGE_URL_WITH_CLASS = /(\w+)(\s+)((https?:\/\/|\/)(\S+))/i
        IMAGE_URL = /((https?:\/\/|\/)(\S+))/i

        def initialize(tag_name, markup, tokens)
            super

            if markup =~ IMAGE_URL_WITH_CLASS_AND_CAPTION
                @class   = $1
                @url     = $3
                @caption = $7
            elsif markup =~ IMAGE_URL_WITH_CAPTION
                @url     = $1
                @caption = $5
            elsif markup =~ IMAGE_URL_WITH_CLASS
                @class = $1
                @url   = $3
            elsif markup =~ IMAGE_URL
                @url = $1
            end
        end

        def render(context)
            if @class
                source = "<a class=\"#{@class}\" href=\"#{@url}\">"
            else
                source = "<a href=\"#{@url}\">"
            end

            source += "<img src=\"#{@url}\">"
            source += "<span>#{@caption}</span>" if @caption
            source += "</a>"

            source
        end
    end
end

Liquid::Template.register_tag('img', Jekyll::ImgTag)
