
var noblox = require("noblox.js")
var express = require("express")

const app = express()

app.use(express.static("public"))

app.use(express.json())

app.get('/', function(request,responce){
  responce.json("Ready!")
})
app.post('/ranker/demote', function(request,responce){
    noblox.demote(process.env.GroupId, request.body.userID).catch(function(err){
        if(err) responce.json(JSON.parse(`{"Success": false, "Errors": "${err}"}`))
    })
    responce.json(JSON.parse(`{"Success": true, "Errors": "Nothing"}`))
})

app.post('/group/shout', function(request,responce){
    if(request.body.message !== ''){
        noblox.shout(process.env.GroupId, request.body.message).catch(function(err){
            if(err) responce.json(JSON.parse(`{"Success": false, "Errors": "${err}"}`))
        })
        responce.json(JSON.parse(`{"Success": true, "Errors": "Nothing"}`))
    }
    noblox.shout(process.env.GroupId, request.body.message).catch(function(err){
        if(err) responce.json(JSON.parse(`{"Success": false, "Errors": "${err}"}`))
    })
    responce.json(JSON.parse(`{"Success": true, "Errors": "Nothing"}`))
})

app.post('/ranker/promote/', function(request,responce){
    noblox.promote(process.env.GroupId, request.body.userID).catch(function(err){
        if(err) responce.json(JSON.parse(`{"Success": false, "Errors": "${err}"}`))
    })
    responce.json(JSON.parse(`{"Success": true, "Errors": "Nothing"}`))
})

app.post('/ranker/setRank', function(request,responce){
    noblox.setRank(process.env.GroupId, request.body.userID, request.body.RankID).catch(function(err){
        if(err) responce.json(JSON.parse(`{"Success": false, "Errors": "${err}"}`))
    })
    responce.json(JSON.parse(`{"Success": true, "Errors": "Nothing"}`))
})

app.delete('/group/handleJoinRequest', function(request,responce){
    noblox.handleJoinRequest(process.env.GroupId, request.body.userID, false).catch(function(err){
        if(err) responce.json(JSON.parse(`{"Success": false, "Errors": "${err}"}`))
    })
    responce.json(JSON.parse(`{"Success": true, "Errors": "Nothing"}`))
})

app.post('/group/handleJoinRequest', function(request,responce){
    noblox.handleJoinRequest(process.env.GroupId, request.body.userID, true).catch(function(err){
        if(err) responce.json(JSON.parse(`{"Success": false, "Errors": "${err}"}`))
    })
    responce.json(JSON.parse(`{"Success": true, "Errors": "Nothing"}`))
})

noblox.setCookie(process.env.Cookie)

const listener = app.listen(process.env.PORT, () => {
  console.log("Your app is listening on port " + listener.address().port);
})

console.log(process.env.GroupId)
