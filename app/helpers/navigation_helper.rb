module NavigationHelper
  
  def page_links_for_navigation
    link = Struct.new(:name, :url)
    page_link = Proc.new do |slug|
      page = Page.find_by_slug(slug)
      if page
        link.new(page.title, page_path(page))
      else
        link.new("TODO: #{slug}", '#')
      end
    end
    [
      page_link.call("bio"),
      link.new("work", works_path),
      link.new("blog", posts_path),
      page_link.call("contact")
    ]
    # [link.new("Home", posts_path),
    # link.new("Archives", archives_path)] +       
    # Page.find(:all, :order => 'title').collect {|page| link.new(page.title, page_path(page))}
  end

  def category_links_for_navigation
    link = Struct.new(:name, :url)
    @popular_tags ||= Tag.find(:all).reject {|tag| tag.taggings.empty? }.sort_by {|tag| tag.taggings.size }.reverse
    @popular_tags.collect {|tag| link.new(tag.name, posts_path(:tag => tag)) }
  end

  def class_for_tab(tab_name, index)
    classes = []
    classes << 'current' if "admin/#{tab_name.downcase}" == params[:controller]
    classes << 'first'   if index == 0
    classes.join(' ')
  end
end
