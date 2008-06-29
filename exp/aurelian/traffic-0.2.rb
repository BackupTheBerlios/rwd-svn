#!/usr/bin/ruby
require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'csv'

if ARGV[0].nil?
  print "Usage:\n\ttraffic-0.2.rb URL\n"
  exit
end

url = ARGV[0].to_s
print "===> Analizing traffic from #{url}\n"
doc = Hpricot(URI.parse(url).read)

filename = doc.search("//title")[0].innerText.split(" - ")[0].to_s + ".csv"
print "===> Data will be saved to #{filename}\n"

writer = CSV.generate(filename)
writer << ["luna", "vizite", "afisari"]

doc.search("//div/center/table/tr/td/table/tr/td/table:eq(1)/tr[@align='right']").each { | e |
  i = 0; 
  r = []; 
  e.children.each { | c |
    next if c.is_a?(Hpricot::Text) or c.innerText=="" or i > 2
    r << c.innerText.gsub('.','')
    i = i + 1
  }
  writer << r
  print "."
}

writer.close

print "\n===> Done.\n"


