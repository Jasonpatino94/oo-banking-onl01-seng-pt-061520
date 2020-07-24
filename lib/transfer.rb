class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else 
      return false
    end
  end

  def execute_transaction
    if valid? && @sender.balance > @amount && self.status == "pending" 
      sender.balance = sender.balance - @amount
      receiver.balance = receiver.balance + @amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > @amount && self.status == "complete"
      receiver.balance = receiver.balance - @amount
      sender.balance = sender.balance + @amount
      self.status = "reversed"
    end
  end

  
end
