class PessoasMailer < ActionMailer::Base
  def invite(nome, email, projeto)
    recipients    email
    from          "Seek <tiago@tiagogodinho.com>"
    subject       projeto.Nome
    body          :nome => nome, :email => email, :projeto => projeto
    content_type  "text/html"
  end
end
