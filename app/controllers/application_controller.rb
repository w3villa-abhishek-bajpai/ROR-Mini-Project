class ApplicationController < ActionController::Base
    before_action :print_display_message
    after_action :after_display_message

    private 

    def print_display_message
        puts "Welcome to My Management System"
    end

    def after_display_message
        puts "------------------------"
        puts "Thank you for using My Management System"
        puts "-------------------------"
    end
end
