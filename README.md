# treasure_tracker

to run this project, make sure you have the latest flutter : 3.22.0

once ready type "flutter pub get" on terminal to fetch all packages

then run play debug on vscode or type in terminal "flutter run -d chrome --web-port=8080"

## you can use different browser, simply change chrome name to whichever you preffer

# To compile and push to hosting
type in terminal "flutter build web --release --web-renderer canvaskit"
then copy all the contents from build/web and put it on public_files folder
once done type in terminal "firebase deploy --only=hosting" and wait for the url and console link to appear

# create account or dashboard?
when you see the login screen with google sign in, if you type in your email address and it is not registered with treasure tracker before,
it will route you to the sign in page instead, otherwise it will show the main screen instead.