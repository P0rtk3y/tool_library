module LoansHelper
  def borrower_form_option(form_builder)
    if @borrower
       content_tag(:p, "Borrower: #{@borrower.name}")
    else
       render partial: "borrowerform", locals: {f: form_builder}
    end
  end
end
