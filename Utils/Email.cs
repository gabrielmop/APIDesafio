using GSF.Net.Smtp;
using System.Net;
using System.Net.Http;
using System.Net.Mail;

namespace APIDesafio.Utils
{
    public class Email
    {
        MailMessage mail = new MailMessage();
      
               
        public void EnviarEmail(string subject, string body)
        {
            mail.From = new MailAddress("gabrel.gabriel@gmail.com");
            mail.To.Add("gabriel_moop@hotmail.com");
            mail.Subject = subject;
            mail.Body = body;

            using (var smtp = new SmtpClient("smtp.gmail.com"))
            {
                smtp.EnableSsl = true; 
                smtp.Port = 587;      
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network; 
                smtp.UseDefaultCredentials = false; 

                // seu usuário e senha para autenticação
                smtp.Credentials = new NetworkCredential("gabrel.gabriel@gmail.com", "atwvzclutkgxghqo");

                // envia o e-mail
                smtp.Send(mail);
            }
        }
        

       
    }
}
