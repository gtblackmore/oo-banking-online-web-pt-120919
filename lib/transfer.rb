class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if @sender.balance < @amount && valid? || @status == "complete"
      "Transaction rejected. Please check your account balance."
    else
      sender.deposit(-@amount)
      receiver.deposit(@amount)
      @status = "complete"
    end
  end
end
