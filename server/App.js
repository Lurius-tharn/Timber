var express = require('express');
var app = express();

var mysql = require('mysql');
var bodyParser = require('body-parser');

app.use(bodyParser.json({type:'application/json'}))
app.use(bodyParser.urlencoded({extended:true}));

var connection = mysql.createConnection({
    host:'localhost',
    port:'3306',
    user:'root',
    database:'timber'
});
app.use((req,res,next) => {
    req.con = connection,
    next()
});

var server = app.listen(4548, () =>{
    var host = server.address().address;
    var port = server.address().port;
});

connection.connect((error) =>{
    if(error) console.log(error);
    else console.log("Serveur lancé sur le port " + server.address().port);

});

const dataRouter = require('./routes/TimberRouter');
app.use("/Timber",dataRouter);
app.listen
