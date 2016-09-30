class Scraper
    attr_accessor :doc, :articles
    
  def initialize
    @doc = Nokogiri::HTML(open("http://www.snopes.com/category/facts/"))
    create_articles
  end
  
  def create_articles
      @articles = []
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
          new_article.accuracy = get_accuracy(article)
          new_article.full_article = get_full_article(article)

          @articles << new_article
      end
      @articles = @articles[0..9]
     # articles.each do |a|
    #      puts a.full_article
    #  end
    end
          
  def get_origin(article)
    origin = article.css("#fact_check_origin").first.parent
    origin.text
  end
  
  def get_claim(article)
    claim = article.css("span.green-label").first.parent
    claim.text
    #This works because it return the FIRST XML element in an
    #array of span.green-label elements.
  end
  
  def get_author(article)
    author = article.css(".author-name")
    author.text.strip
  end
  
  def get_author_bio(article)
    author_bio = article.css(".author-bio p")
    author_bio.text.strip
  end
  
  def get_accuracy(article)
   accuracy = article.css("div.claim-old")
   accuracy.text.strip.downcase.capitalize
  end
  
  def get_full_article(article)
    full_article = article.css(".article-text")
    full_article.text.gsub(/\s{2,}/, "\n").gsub("if(window.proper_display) { proper_display('snopes_featured_1'); }", "").gsub("if(window.proper_display) { proper_display('snopes_content_1'); }", "")
  end
  
end