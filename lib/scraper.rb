class Scraper
    attr_accessor :doc, :article
    
  def initialize
    @doc = Nokogiri::HTML(open("http://www.snopes.com/category/facts"))
    create_articles
  end
  
  def create_articles
      articles = []
      article_objects = @doc.css("h4")
      article_objects.each do |object|
          new_article = Article.new
          new_article.title = object.css("a").text
          new_article.url = object.css("a").attribute("href").value
          new_article.origin = get_origin(new_article.url)
          new_article.claim = "Hello"

          articles << new_article
      end
      articles.each do |a|
          puts a.origin
      end
    end
          
  def get_origin(url)
    article = Nokogiri::HTML(open("http://www.snopes.com" + url))
    origin = article.css("#fact_check_origin").first.parent
    origin.text
  end
  

  
  
end