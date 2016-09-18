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
          article = Nokogiri::HTML(open("http://www.snopes.com" + new_article.url))
          new_article.origin = get_origin(article)
          new_article.claim = get_claim(article)
          new_article.author = get_author(article)
          new_article.author_bio = get_author_bio(article)

          articles << new_article
      end
      articles.each do |a|
          puts a.author_bio
      end
    end
          
  def get_origin(article)
    origin = article.css("#fact_check_origin").first.parent
    origin.text
  end
  
  def get_claim(article)
    claim = article.css("span.green-label").first.parent
    claim.text
    #This works because it return the FIRST XML element in an
    #array of span.green-label elements. Hizell yeah
  end
  
  def get_author(article)
    author = article.css(".author-name").first.parent
    author.text.strip
  end
  
  def get_author_bio(article)
    author_bio = article.css(".author-bio p").first.parent
    author_bio.text.strip
  end
  
end