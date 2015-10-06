class Users::RegistrationController < Devise::RegistrationController
    
    def create
        super do |resources|
            if paras[:plan]
                resource.plan_id = params[:plan]
                if resource.plan_id == 2
                    resource.save_with_payment
                else
                    resource.save
                end
            end
    end
    end
end
