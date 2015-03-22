class GetCategoriesFromRubyToolbox < ActiveJob::Base

  def perform
    Mechanize.new{|agent| agent.user_agent_alias = 'Mac Safari'}.get('http://www.ruby-toolbox.com/') do |page|
      links = page.links

      links.each do |category_link|
        next unless category_link.href =~ /\A\/categories\//
        name = category_link.text.split("\n")[1]
        next unless name
        cat = Category.find_or_create_by name: name
        scrape_category(cat, category_link)
        sleep 1
      end
    end
  end

  def scrape_category(cat, category_link)
    category_page = category_link.click
    parent_name = category_page.search('a.icon-folder-close').first.try :text
    cat.parent = Category.find_or_create_by name: parent_name, parent_id: nil

    projects = category_page.search('a.project-label')
    projects.each do |project_link|
      project_name = project_link.attributes['name']
      cat.projects.create name: project_name
    end
    cat.save
  end
end