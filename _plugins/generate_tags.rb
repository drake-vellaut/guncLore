# _plugins/generate_tags.rb
module Jekyll
  class TagPageGenerator < Generator
    safe true

    def generate(site)
      site.tags.each do |tag, posts|
        site.pages << TagPage.new(site, site.source, tag)
      end
    end
  end

  class TagPage < Page
    def initialize(site, base, tag)
      @site = site
      @base = base
      @dir  = "tag/#{Jekyll::Utils.slugify(tag)}"
      @name = "index.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_page.html')
      self.data['tag'] = tag
      self.data['title'] = "Posts tagged with #{tag}"
      self.data['tag_posts'] = site.tags[tag].sort_by { |p| p.date }.reverse
      begin
        File.write(File.join(site.dest, "plugin-ran.txt"), "Tag plugin executed successfully.")
rescue => e
        File.write(File.join(site.dest, "plugin-error.txt"), "Plugin error: #{e.message}")
      end

    end
  end
end
