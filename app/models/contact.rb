class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.to_s.upcase != "MR. WHITE CLOUD"
      record.errors[attribute] << "Invalid name"
    end
  end
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.to_s.upcase != "EXAMPLE@WHITECLOUD.COM" and value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << "Invalid email"
    end
  end
end

class MessageValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.to_s.upcase != "TYPE YOUR MESSAGE HERE..."
      record.errors[attribute] << "Invalid message"
    end
  end
end

class Contact
  include ActiveModel::Validations

  validates :name, :presence => true, :name => true
  validates :email, :presence => true, :email => true
  validates :message, :presence => true, :message => true
  
  attr_accessor :id, :name, :email, :phone, :subject, :message

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def to_key
  end

  def save
    if self.valid?
      Notifier.support_notification(self).deliver!
      return true
    end
    return false
  end

  def persisted?
    false
  end
end
