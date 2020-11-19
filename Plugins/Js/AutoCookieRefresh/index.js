const { setCookie, refreshCookie } = require('noblox.js')

function refresh(cookie){
    return refreshCookie(cookie).then(function(NewCookie){
        return setCookie(NewCookie)
    })
}


setTimeout(refresh, 3600)

module.exports = refresh
