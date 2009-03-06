# Methods added to this helper will be available to all templates in the application.
require 'htmldiff' # TODO: how should I keep track of dependencies?

module ApplicationHelper
  
  include HTMLDiff
  
end
