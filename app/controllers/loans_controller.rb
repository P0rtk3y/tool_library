class LoansController < ApplicationController
  skip_before_action :redirect_if_not_logged_in
end
