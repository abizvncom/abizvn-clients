module Abizvn
  module Clients
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
