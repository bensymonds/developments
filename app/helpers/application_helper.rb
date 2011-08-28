module ApplicationHelper
  def setup_development(development)
    development.tap do |d|
      d.build_address unless d.address
      d.links.build
    end
  end
  
end
