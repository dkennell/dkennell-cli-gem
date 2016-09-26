class CLI
    attr_accessor :scraper

  def initialize
      @scraper = Scraper.new 
  end
    
  def start
    puts " "
    puts "            Welcome to..."
    puts "---=====<<<Check The Facts!>>>=====---"
    puts "       A Snopes Scraper and CLI"
    puts " "
    puts "Please choose the article you would like to read"
    puts "more about by entering the corresponding number."
    puts " "
    i = 0
    @scraper.articles.each do |article|
        i += 1
        puts "#{i}. " + article.title
    end
    puts " "
    puts "Enter an article number or type 'exit' to exit: "
    input = gets.chomp("Enter a number >> ")
    select_article(input)
  end
  
def select_article(last_input)
  if last_input.to_i < 31
    puts "---------Article Title---------"
    puts scraper.articles[last_input.to_i - 1].title
    puts "------Article Information------"
    puts "What would you like to know about this article?"
    puts "1: Claim"
    puts "2: Accuracy"
    puts "3: Origin"
    puts "4: Author"
    puts "5: Author Bio"
    puts "6: Return to All Articles"
    input = gets.chomp
    second_layer(last_input, input)
  else
    puts "Sorry, I don't think we have that article."
  end
end

def second_layer(last_input, input)
    case input
    when "1"
        puts scraper.articles[last_input.to_i - 1].claim
        puts "Press any key to continue..."                                                                                                    
        STDIN.getch                                                                                                              
        print ''
          select_article(last_input)
    when "2"
        print "Accuracy: "
        puts scraper.articles[last_input.to_i - 1].accuracy
        puts "Press any key to continue..."                                                                                                    
        STDIN.getch                                                                                                              
        print ''
        select_article(last_input)
    when "3"
                puts scraper.articles[last_input.to_i - 1].origin
        puts "Press any key to continue..."                                                                                                    
        STDIN.getch                                                                                                              
        print ''
        select_article(last_input)
    when "4"
                puts scraper.articles[last_input.to_i - 1].author
        puts "Press any key to continue..."                                                                                                    
        STDIN.getch                                                                                                              
        print ''
        select_article(last_input)

    when "5"
        puts "Accuracy of Claim:"
        puts scraper.articles[last_input.to_i - 1].author_bio
        puts "Press any key to continue..."                                                                                                    
        STDIN.getch                                                                                                              
        print ''
        select_article(last_input)

    when "6"
        start
    end
end
        
        
end

