const { setCookie, refreshCookie } = require('noblox.js')

function refresh(cookie){
    return refreshCookie(cookie).then(function(NewCookie){
        return setCookie(NewCookie)
    })
}

refresh(process.env.Cookie)
setTimeout(refresh, 3600)
