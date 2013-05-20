module Jekyll
    class StartGalleryTag < Liquid::Tag
        @count = nil

        GALLERY_WITH_MULTIPLE_IMAGES = /([0-9]+)/i

        def initialize(tag_name, markup, tokens)
          super

          if markup =~ GALLERY_WITH_MULTIPLE_IMAGES
              @count = Integer($1)
          else
              @count = 1
          end
        end

        def render(context)
            if @count == 1
                @class = ' one'
            elsif @count == 2
                @class = ' two'
            elsif @count == 3
                @class = ' three'
            elsif @count == 4
                @class = ' four'
            elsif @count == 5
                @class = ' five'
            elsif @count == 6
                @class = ' six'
            end

            "<div class=\"gallery#{@class}\">"
        end
    end
end

Liquid::Template.register_tag('gallery', Jekyll::StartGalleryTag)
