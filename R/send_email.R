# Load blastula package
library("blastula")

# Generate the email object using blastula
email_object <- blastula::render_email(here::here("R","email_content.qmd"))

# Send email if there's an even next week or any new updates
if(nrow(trigger_2) + nrow(trigger_10) + nrow(updates) >=1 )
  blastula::smtp_send(email_object,
          from = c("COH3" = "centraloregonhash@gmail.com"),
          to = "centraloregonhash@gmail.com",
          bcc = c("centraloregonh3@googlegroups.com",
                  "megan.holtorf@gmail.com"), # include the user, Google groups won't send directly to sender.
          subject = paste0("Central Oregon Hashes"),
          credentials = creds_envvar(
            user = "megan.holtorf@gmail.com", # Update if transferred to new owner
            host = "smtp.gmail.com",
            port = 465,
            use_ssl = TRUE,
            pass_envvar = "GMAIL_APP_PASSWORD") # Points to a GitHub secret with Google App password, update is owner changes
            )

#===============================================================================
# Uncomment code below for local testing using a creds file
#===============================================================================

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
# 
# if(nrow(trigger) + nrow(updates) >=1 )
#   blastula::smtp_send(email_object,
#                       from = c("COH3" = "centraloregonhash@gmail.com"),
#                       #to = "megan.holtorf@gmail.com",
#                       to = "centraloregonhash@gmail.com",
#                       bcc = "centraloregonh3@googlegroups.com",
#                     subject = paste0("Central Oregon Hashes"),
#                     credentials = creds_file("gmail_creds")
# )
