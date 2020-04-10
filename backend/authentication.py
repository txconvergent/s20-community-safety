import pyrebase

config = {
  
  # config information from Firebase after registering Bundle ID
  
}

firebase = pyrebase.initialize_app(config)
auth = firebase.auth()

invalid = True
while invalid:
  # connect data pipeline to frontend for email and password
  email = input("Enter University Email Address: ")
  password = input("Enter Password: ")

  domain = email[-10:]
  if domain == 'utexas.edu':
    invalid = False
    user = auth.create_user_with_email_and_password(email, password)
  else:
    print('Please enter email address with utexas.edu domain')

