import pyrebase

config = {
  
  # config information from Firebase after registering Bundle ID
  
}

firebase = pyrebase.initialize_app(config)
auth = firebase.auth()

# connect button from frontend authentication page
button = 'Create Account'
# or
# button = 'Sign In'
# or
# button = 'Reset Password'

# connect data pipeline to frontend for email and password
email = input("Enter University Email Address: ")
password = input("Enter Password: ")

if button = 'Create Account':
  invalid = True
  while invalid:

    domain = email[-10:]
    if domain == 'utexas.edu':
      invalid = False
      user = auth.create_user_with_email_and_password(email, password)
      signin = auth.sign_in_with_email_and_password(email, password)
      auth.send_email_verification(signin['idToken'])
      print('Email verification has been sent')
    else:
      print('Please enter email address with utexas.edu domain')

if button = 'Sign In':
  invalid = True
  while invalid:
    try:
      signin = auth.sign_in_with_email_and_password(email, password)
      invalid = False
    except:
      print('Invalid email or password')

if button = 'Reset Password':
  auth.send_password_reset_email(email)
  print('We sent you an email to reset your password')
