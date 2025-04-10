class CrudNotificationMailer < ApplicationMailer
  def create_notification(object)
    @object = object
    @object_count = object.class.count
    mail(to: 'abajpai2811@gmail.com', subject: "New Object for #{object.class} has been created")
  
  end

  def update_notification(object)
    @object = object
    @object_count = object.class.count
    mail(to: 'abajpai2811@gmail.com', subject: "Object for #{object.class} has been update")
   
  end

 
  def delete_notification(object, count)
    @object = object
    @object_count = count
    mail(to: 'abajpai2811@.gmailcom', subject: "Object for #{object.class} has been deleted")
    
  end
end
