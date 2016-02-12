module Client
  class CustomerUser < User 
    belongs_to :customer

    default_scope { where(user_type: 1)}
  end
end