class TextAnalyzer
  def process
    file = File.open('text.txt')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.count("\n") + 1} lines"}
analyzer.process { |text| puts "#{text.split.size} words" }
