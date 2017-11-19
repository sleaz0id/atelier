unless Category.any?
  FactoryGirl.create_list(:category, 7) 
  puts 'Categories created'
end
