# Load blastula package
library("blastula")

# # Create file containing credentials for email account
# blastula::create_smtp_creds_key(
#   id = "gmail",
#   user = "megan.holtorf@gmail.com",
#   host = "smtp.gmail.com",
#   port = 465,
#   use_ssl = TRUE
# )

# Store SMTP credentials as a file with the filename "gmail_creds"
# To use gmail, go to My Account Help page and search for App passwords
# Generate an App password and enter it in the pop up dialog after running code below
# File is saved to your current working directory
# blastula::create_smtp_creds_file(
#   file = "gmail_creds",
#   user = "megan.holtorf@gmail.com",
#   host = "smtp.gmail.com",
#   port = 465,
#   use_ssl = TRUE
# )

# Generate the email object using blastula
email_object <- blastula::render_email("email_content.qmd")
#email_object <- blastula::render_email("email_content.Rmd")

# Send email
blastula::smtp_send(email_object,
          from = "megan.holtorf@gmail.com",
          to = "megan.holtorf@gmail.com",
          subject = paste0("Central Oregon Hashes"),
          credentials = creds_key(id = "GMAIL_APP_PASSWORDkk"))