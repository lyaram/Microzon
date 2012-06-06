class MyPage < BasePageClass

  direct_url "http://www.google.com"
  expected_element :text_field, :name => "q"
  expected_title "Google"
  text_field :search_box, :name => "q"
  button :search, :name => "btnG"

  self.search_box = "Watirmelon"
  self.search
  
end
