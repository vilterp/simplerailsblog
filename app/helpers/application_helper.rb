# Methods added to this helper will be available to all templates in the application.
require 'htmldiff' # TODO: how should I keep track of dependencies?

module ApplicationHelper
  
  include HTMLDiff
  
  # loosely based on Rails' excerpt helper
  # http://rails.rubyonrails.org/classes/ActionView/Helpers/TextHelper.html#M001713
  def excerpts(text, word, options={})
    omission = options[:omission] || '...'
    radius = options[:radius] || 5
    word.class == String ? re = /(#{Regexp.escape(word)})/ : re = word
    return nil unless text =~ re
    ans = ""; start = 0; last_range = -2..-1
    while text[start..-1] =~ re
      match_index = start + (text[start..-1] =~ re)
      start_ind = [0, match_index - radius].max
      end_ind = [match_index + text.match(re)[0].length + radius, text.length - 1].min
  	unless last_range.include? start_ind-1
      ans.rstrip!; ans << omission unless start_ind == 0
      last_range = start_ind..end_ind
      ans << text[last_range].lstrip
  	else
  	  ans << text[last_range.end+1..end_ind]
      last_range = last_range.begin..end_ind
  	end
      start = match_index + text.match(re)[0].length
    end
    ans.rstrip!; ans << omission unless last_range.end == text.length-1
    options[:highlight].nil? ? ans : ans.gsub(re,options[:highlight])
  end
  
  def diff_excerpts(text1, text2)
    excerpts(diff(text1,text2),/(<ins class="diffmod">.*?<\/ins>|<del class="diffmod">.*?<\/del>)/)
  end
  
end
