# Auto Cookie Refresh System
Author: boI#0171/bacionhairmanfur2
# Information
This refresh's the cookie everytime to provent these exploiters from cookie stealing.
# Setup
Go into your glitch project and you will see a New File Button
Name it cookieRefresh.js

Click "Add This File"

Go back where it says "AutoCookieRefresh" on the github project

Go into the index.js file and copy the code from it and paste it into the cookieRefresh.js file on the glitch project

Create a new line in the server.js file and paste this in

let refresh = require('./cookieRefresh.js')

refresh(process.env.Cookie)


And now your done!
