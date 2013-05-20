module Jekyll
    class EndGalleryTag < Liquid::Tag
        def render(context)
            '</div>'
        end
    end
end

Liquid::Template.register_tag('endgallery', Jekyll::EndGalleryTag)
